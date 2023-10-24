import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medical_app/model/request/messaging/sendMess_model.dart';
import 'package:medical_app/model/response/messaging/messaging_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_constant.dart';

class MessagingHelper{
  static var client= http.Client();

  static Future<List<dynamic>> sendMessage(SendMess model) async{
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    String? token= prefs.getString('token');

    Map<String,String> requestHeaders={
      'Content-type':'application/json',
      'token':"Bearer $token"
    };
    var urlPost= Uri.parse(userSendMess);

    var response= await client.post(
      urlPost,
      headers: requestHeaders,
      body: jsonEncode(model.toJson())
    );
    if (response.statusCode==200){
      ReceivedMessage message=  ReceivedMessage.fromJson(jsonDecode(response.body));
      return [message];
    } else{
      throw Exception('Failed to send message.');
    }
  }
  static Future<List<ReceivedMessage>> getMessage(String chatId, int offset) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
    };
    var urlGet = Uri.parse('http://192.168.1.7:3000/userMessage/$chatId');
    print('urlGet: $urlGet');
    var response = await client.get(
        urlGet,
        headers: requestHeaders,
    );
    if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        
        try {
            var messageList = List<ReceivedMessage>.from(jsonDecode(response.body).map((item) => ReceivedMessage.fromJson(item)));
            return messageList;
          } catch (e) {
            print('Error converting response body: $e');
            throw Exception("Có lỗi khi chuyển đổi dữ liệu trả về từ API");
          }
    } else {
        print('Error status code: ${response.statusCode}');
        print('Error body: ${response.body}');
        throw Exception("Có lỗi khi tải tin nhắn");
    }
  }
}