import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:medical_app/config/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


import '../model/mess_model.dart';

class ApiService {
  late IO.Socket socket;
  List<Message> messages = [];
  final _messagesController = StreamController<List<Message>>.broadcast();

  Stream<List<Message>> get messagesStream => _messagesController.stream;

  ApiService() {
   
    socket = IO.io(url, <String, dynamic>{
      'transports': ['websocket'],
    });
    socket.connect();

    socket.on('new_message', (data) {
      final message = Message.fromJson(data);
      messages.add(message);
      _messagesController.add(messages); // Cập nhật giao diện tại đây
    });
  }
 Future<void> getInitialMessages(String appointmentId) async {
    final initialMessages = await getMessagesByAppointmentId(appointmentId);
    messages.addAll(initialMessages);
    _messagesController.add(messages);
  }


  Future<void> sendMessage( String content,String appointmentId, String receiverId) async {
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    String? token= prefs.getString('token');
    String? userId= prefs.getString('userId');
  

    final response = await http.post(
      Uri.parse(userSendMess),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'content': content,
        'appointmentId': appointmentId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Lỗi khi gửi tin nhắn ${response.body}');
    }

    
     // Phát sự kiện 'new_message' với tin nhắn mới
  // Phát sự kiện 'new_message' với tin nhắn mới
  socket.emit('new_message', {
    'content': content,
    'chat': appointmentId, // Sử dụng appointmentId như là ID của cuộc trò chuyện
    'sender': userId, // Sử dụng userId như là ID của người gửi
    'receiver':receiverId , 
    'onModelSender': 'users', // Đặt onModelSender là 'users'
    'onModelReceiver': 'doctors', // Đặt onModelReceiver là 'doctors'
  });
  }

  Future<List<Message>> getMessagesByAppointmentId(String appointmentId) async {
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    String? token= prefs.getString('token');
    String? userId= prefs.getString('userId'); // Lấy userId

     final response = await http.get(Uri.parse('$getAppointmentMess/$appointmentId'));

    if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        
        return jsonResponse.map((item) {
        
          final message = Message.fromJson(item);
          final isCurrentUser = userId != null && message.senderId != null && message.senderId == userId;// Kiểm tra nếu senderId giống với userId
          return message.copyWith(isCurrentUser: isCurrentUser); // Tạo một bản sao của message với isCurrentUser được cập nhật
        }).toList();
      } else {
        throw Exception('Failed to load messages');
      }


  }
 

}