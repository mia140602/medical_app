import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/widgets/flutter_toast.dart';
import 'package:medical_app/view/feature/auth/signup/bloc/signup_bloc.dart';
import 'package:http/http.dart' as http;

class SignupController {
  final BuildContext context;
  const SignupController({required this.context});


  Future <void> handleEmailSignup() async{
    final state = context.read<SignupBloc>().state ;
    

    String email=state.email;
    String password=state.password;

    if(email.isEmpty){
      toastInfo(msg: "Email không được bỏ trống");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "Password không được để trống");
      return;
    }
    
    try {
      // Gửi yêu cầu đăng ký đến máy chủ Node.js
      var regBody = {
        "email": state.email,
        "password": state.password,
      };

      var  response= await http.post(Uri.parse(registration),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      if (response.statusCode == 200) {
        print('Đăng ký thành công');
         toastInfo(msg: "Xác minh email đã được gửi. Kiểm tra hòm thư của bạn");
        // Tiến hành xác minh email tại đây nếu bạn muốn
        // Trường hợp thành công, điều hướng đến trang đăng nhập
        Navigator.of(context).pushNamed("/signin");
      } else {
        print('Đăng ký thất bại: ${jsonDecode(response.body)['error']}');
        toastInfo(msg: "Đăng ký thất bại: ${jsonDecode(response.body)['error']}");
      }
    } catch (error) {
      print('Lỗi: $error');
      toastInfo(msg: "Đã xảy ra lỗi: $error");
    }
  }
}

  //   try{

  //     final credential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      
  //     if(credential.user!=null) {
  //       await credential.user?.sendEmailVerification();
  //       await credential.user?.updateDisplayName("Thảo");
  //       toastInfo(msg: "Xác minh email đã được gửi. Kiểm tra hòm thư của bạn");
  //       var regBody={
  //         "email":state.email,
  //         "password":state.password
  //   };

  //   var response= await http.post(Uri.parse(registration),
  //   headers: {"Content-Type":"application/json"},
  //   body:jsonEncode(regBody)
  //   );
  //       // Navigator.of(context).pushNamed("/fillProfile");
  //       Navigator.of(context).pushNamed("/signin");
  //     }
  //   }on FirebaseAuthException catch(e){
  //     if(e.code=='weak-passwork') {
  //       toastInfo(msg: "Mật khẩu phải có ít nhất 6 ký tự");
  //     } else if(e.code=='email-already-in-use'){
  //       toastInfo(msg: "Email đã đăng ký cho tài khoản khác");
  //     }else if(e.code=='invalid-email'){
  //       toastInfo(msg: "Email này không tồn tại");
  //     }
  //   }
//    }
// }