import 'dart:convert';

import 'package:medical_app/config/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import 'package:http/http.dart' as http;

Future<UserModel> getUserInfo() async {
  final SharedPreferences prefs= await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? '';
  String? userId= prefs.getString('userId');

  if (token.isNotEmpty) {
    final response = await http.get(
      Uri.parse('$getUserProfileInfo/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return UserModel.fromJson(jsonResponse['data']);
    } else {
      
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Có lỗi khi tải thông tin người dùng');
    }
  }
  throw Exception('Không có token nào được tìm thấy');
}