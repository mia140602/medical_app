import 'package:flutter/cupertino.dart';

class AuthRepository{
  Future <String> signIn(
    @required String useremail,@required String userpassword,
  ) async{
    print("attempting signin");
    await Future.delayed(Duration(seconds: 3));
    print("Sign in");
    throw Exception('failed to signin');
    return 'abc';
  }
  Future <void> signUp(
     @required String useremail,@required String userpassword,
    
  ) async{
    await Future.delayed(Duration(seconds: 2));
  }

  Future <String> confirmSignUp(
    @required String useremail, @required String confirmationCode
  ) async{
    await Future.delayed(Duration(seconds: 3));
    return 'abc';
  }

    Future <void> signOut() async{
    await Future.delayed(Duration(seconds: 2));
  }
}