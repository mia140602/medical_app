import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/global.dart';
import 'package:medical_app/widgets/flutter_toast.dart';
import 'package:medical_app/view/feature/auth/signin/bloc/signin_bloc.dart';
import 'package:http/http.dart' as http;

class SignInController {
  final BuildContext context;
  const SignInController({
    required this.context,
  });



  Future <void> handleSignIn(String type) async{
    try{
      if(type=="email"){
        //BlocProvider.of<SignInBloc>(context).state
        final state= context.read<SigninBloc>().state;
        String emailAddress= state.email;
        String password= state.password;
        if(emailAddress.isEmpty){
          toastInfo(msg: "Bạn cần phải điền email");
          return;
        }
        if(password.isEmpty){
          toastInfo(msg: "Bạn cần phải điền mật khẩu ");
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
          var jsonResponse=jsonDecode(response.body);
          if(jsonResponse['status']){

          }else{
            print("something went wrong");
          }

        } catch (e) {
          
        }
        // try{
        //   final credential = await FirebaseAuth.instance
        //   .signInWithEmailAndPassword(email: emailAddress, password: password);
        //   if(credential.user==null){
        //   toastInfo(msg: "Tài khoản không tồn tại");
        //   return;
        //   } 
        //   if(!credential.user!.emailVerified){
        //   toastInfo(msg: "Email chưa được xác minh");
        //   return;
        //   }
        //   var user =credential.user;
        //   if(user!= null){
        //     //we got verified user from firebase
        //     print("có tài khoản");
        //     Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");
        //     Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
            

        //   }else{
        //   toastInfo(msg: "Hiện tại bạn không phải người dùng của app");
        //   return;
        //   }
        // } on FirebaseAuthException catch(e) {
        //   if(e.code=='user-not-found'){
        //     print("Email này chưa có người dùng nào");
        //     toastInfo(msg: "Email chưa đăng ký");


        //   }else if(e.code=='wrong-password'){
        //     print("sai mật khẩu");
        //     toastInfo(msg: "mật khẩu sai");
        //   } else if(e.code== 'invalid-email'){
        //     print("Email không tồn tại");
        //     toastInfo(msg: "Email không tồn tại");
        //   }
        // }
      }
    }catch(e){
      throw e;
    }
  }
}