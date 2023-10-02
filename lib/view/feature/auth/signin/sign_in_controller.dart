import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/global.dart';
import 'package:medical_app/view/feature/application/application_page.dart';
import 'package:medical_app/widgets/flutter_toast.dart';
import 'package:medical_app/view/feature/auth/signin/bloc/signin_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../model/user_model.dart';

class SignInController {
  final BuildContext context;
  late SharedPreferences prefs;

  SignInController({required this.context}) {
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SigninBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "Bạn cần phải điền email");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Bạn cần phải điền mật khẩu ");
          return;
        }
        try {
          var regBody = {
            "email": state.email,
            "password": state.password,
          };

          var response = await http.post(
            Uri.parse(login),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(regBody),
          );

          var jsonResponse = jsonDecode(response.body);

          if (jsonResponse['status']) {
            String mytoken = jsonResponse['token'];
            await prefs.setString('token', mytoken);

          final user = UserModel.fromJson(jsonResponse['data']);
          final userJson = jsonEncode(user.toJson());
          await prefs.setString('user', userJson);
          print('Response from server: $jsonResponse');
          
            print('User data: ${user.toString()}');
            if (jsonResponse['profileCompleted']) {
            Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil("/fillProfile", (route) => false);
          }
        } else {
          print("something went wrong");
          toastInfo(msg: jsonResponse['message']);
        }
      } catch (e) {
        print("Đã xảy ra lỗi: $e");
        toastInfo(msg: "Đã xảy ra lỗi khi đăng nhập");
      }
      }
    } catch (e) {
      throw e;
    }
  }
}