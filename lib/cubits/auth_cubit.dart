
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/model/auth_credentials.dart';

enum AuthState{signin, signup, confirmSignup, letIn}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(): super(AuthState.signin);
  
  late AuthCredentials credentials;
  void showLetIn()=> emit(AuthState.letIn);
  void showSignin()=> emit(AuthState.signin);
  void showSignup()=> emit(AuthState.signup);
  
  void showConfirmSignup({
    required  useremail, required String userpassword,
  }) { 
    credentials =AuthCredentials(useremail: useremail,
    userpassword: userpassword
    );
    emit(AuthState.confirmSignup);
    }
}