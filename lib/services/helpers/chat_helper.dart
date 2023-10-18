import 'dart:convert';


import 'package:http/http.dart' as https;
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/model/request/chat/createChat.dart';
import 'package:medical_app/model/response/chat/get_chat_model.dart';
import 'package:medical_app/model/response/chat/initialMgs_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatHelper{
  static var client= https.Client();

  //
  static Future<List<dynamic>> apply(CreateChat model) async{
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    String? token= prefs.getString('token');

    Map<String,String> requestHeaders={
      'Content-type':'application/json',
      'token':"Bearer $token"
    };
    var urlPost= Uri.https(url,createChat);

    var response= await client.post(
      urlPost,
      headers: requestHeaders,
      body: jsonEncode(model.toJson())
    );
    if (response.statusCode==200){
      var first= initialChatFromJson(response.body).id;
      return [true,first];
    } else{
      return [false];
    }
  }
  static Future<List<GetChat>> getConversations() async{
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    String? token= prefs.getString('token');

    Map<String,String> requestHeaders={
      'Content-type':'application/json',
      'token':"Bearer $token"
    };
    var urlGet= Uri.https(url,getChat);

    var response= await client.get(
      urlGet,
      headers: requestHeaders,
      
    );
    if (response.statusCode==200){
      var chats= getChatFromJson(response.body);
      return chats;
    } else{
      throw Exception("Không thể load đoạn hội thoại");
    }
  }
}