import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/widgets/flutter_toast.dart';
import 'package:medical_app/view/feature/auth/signup/bloc/signup_bloc.dart';

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

    try{

      final credential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if(credential.user!=null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName("Thảo");
        toastInfo(msg: "Xác minh email đã được gửi. Kiểm tra hòm thư của bạn");
        Navigator.of(context).pop();
      }
    }on FirebaseAuthException catch(e){
      if(e.code=='weak-passwork') {
        toastInfo(msg: "Mật khẩu phải có ít nhất 6 ký tự");
      } else if(e.code=='email-already-in-use'){
        toastInfo(msg: "Email đã đăng ký cho tài khoản khác");
      }else if(e.code=='invalid-email'){
        toastInfo(msg: "Email này không tồn tại");
      }
    }
  }
}