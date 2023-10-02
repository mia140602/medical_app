import 'dart:convert';
import 'package:medical_app/config/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:medical_app/widgets/flutter_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../model/user_model.dart';

class FillProfileController {
  late SharedPreferences prefs;

  FillProfileController(){
    initSharedPref(); 
  }
  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }
  Future<String> getEmailFromToken() async {
    
    final token = prefs.getString('token') ?? '';
    if (token.isNotEmpty) {
      final decodedToken = JwtDecoder.decode(token);
      return decodedToken["email"] ?? '';
    }
    return '';
  }
  Future<bool> updateProfile(String name, String nickName, String birthday, String gender) async {
  if (name.isEmpty || nickName.isEmpty || birthday.isEmpty || gender.isEmpty) {
    toastInfo(msg: "Vui lòng không để trống bất kỳ thông tin nào");
    return false;
  }
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? '';
  if (token.isNotEmpty) {
    final email = JwtDecoder.decode(token)["email"] ?? '';
    if (email.isNotEmpty) {
      try{
        var response = await http.put(
          Uri.parse(updateUserProfile),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": email,
            "name": name,
            "nickName": nickName,
            "birthday": birthday,
            "gender": gender,
          }),
        );
        var jsonResponse =jsonDecode(response.body);
        print('Response from server: $jsonResponse');
        print(email);
        if (jsonResponse['status']) {
          toastInfo(msg: "Cập nhật thành công");
          return true;
        } else {
          toastInfo(msg: "Cập nhật không thành công, vui lòng xem lại");
          return false;
        }
      }catch(e){
        throw e;
      }
    }
  }
  return false;
}

void saveUser(UserModel user) {
final jsonString = jsonEncode(user.toJson());
prefs.setString('user', jsonString);
}

UserModel? getUser() {
  final jsonString = prefs.getString('user');
  if (jsonString != null) {
    final jsonData = jsonDecode(jsonString);
    return UserModel.fromJson(jsonData);
  }
  return null;
}


}

