
class SignupState{
  final String email;
  final String password;
  // final FormSubmissionStatus formStatus;

//   bool get isvalidEmail => useremail.contains("@");
//   bool passwordValidator() {
//   if (userpassword.isEmpty) return false;
//   //(RegExp pattern) để kiểm tra tính hợp lệ của mật khẩu.
//   String pattern =
//       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//   //Hàm hasMatch trả về true nếu mật khẩu khớp với biểu thức chính quy, ngược lại trả về false.
//   RegExp regex = RegExp(pattern);
//   return regex.hasMatch(userpassword);
// }

  const SignupState({this.email='',
  this.password='',}
  // this.formStatus= const InitialFormStatus(),
  );
  SignupState copyWith({String? email,
      String? password,
      // FormSubmissionStatus? formStatus,
  }){
    return SignupState(
       email: email?? this.email,
      password: password?? this.password,
      // formStatus: formStatus?? this.formStatus,
    );
  }
 
  
}


//thread safe
