import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:medical_app/model/request/messaging/sendMess_model.dart';
import 'package:medical_app/model/response/messaging/messaging_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_constant.dart';

class MessagingHelper{
  static var client= https.Client();

  static Future<List<dynamic>> sendMessage(SendMess model) async{
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    String? token= prefs.getString('token');

    Map<String,String> requestHeaders={
      'Content-type':'application/json',
      'token':"Bearer $token"
    };
    var urlPost= Uri.https(url,userSendMess);

    var response= await client.post(
      urlPost,
      headers: requestHeaders,
      body: jsonEncode(model.toJson())
    );
    if (response.statusCode==200){
      ReceivedMessage message=  ReceivedMessage.fromJson(jsonDecode(response.body));
      Map<String,dynamic> responseMap= jsonDecode(response.body);
      return [true,message,responseMap];
    } else{
      return [false];
    }
  }

  static Future<List<dynamic>> getMessage(String chatId, int offset) async{
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    String? token= prefs.getString('token');

    Map<String,String> requestHeaders={
      'Content-type':'application/json',
      'token':"Bearer $token"
    };
    var urlGet= Uri.https(url,userMess);

    var response= await client.get(
      urlGet,
      headers: requestHeaders,
      
    );
    if (response.statusCode==200){
      var message= receivedMessageFromJson(response.body);
     
      return message;
    } else{
      throw Exception("Có lỗi khi tải tin nhắn");
    }
  }
 
}