import 'package:medical_app/view/feature/auth/form_submission_status.dart';

class SignupState{
  final String useremail;
  final String userpassword;
  final FormSubmissionStatus formStatus;

  bool get isvalidEmail => useremail.contains("@");
  bool passwordValidator() {
  if (userpassword.isEmpty) return false;
  //(RegExp pattern) để kiểm tra tính hợp lệ của mật khẩu.
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  //Hàm hasMatch trả về true nếu mật khẩu khớp với biểu thức chính quy, ngược lại trả về false.
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(userpassword);
}

  SignupState({this.useremail='',
  this.userpassword='',
  this.formStatus= const InitialFormStatus(),
  });
  SignupState copyWith({String? useremail,
      String? userpassword,
      FormSubmissionStatus? formStatus,
  }){
    return SignupState(
      useremail: useremail?? this.useremail,
      userpassword: userpassword?? this.userpassword,
      formStatus: formStatus?? this.formStatus,
    );
  }
}