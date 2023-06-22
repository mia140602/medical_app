import 'package:medical_app/view/ui/auth/form_submission_status.dart';

class SigninState{
  final String useremail;
  final String userpassword;
  final FormSubmissionStatus formStatus;
  bool get isValidPassword=> userpassword.length>6;
  bool get isvalidEmail => useremail.contains("@");

  SigninState({this.useremail='',
  this.userpassword='',
  this.formStatus= const InitialFormStatus(),
  });
  SigninState copyWith({String? useremail,
      String? userpassword,
      FormSubmissionStatus? formStatus,
  }){
    return SigninState(
      useremail: useremail?? this.useremail,
      userpassword: userpassword?? this.userpassword,
      formStatus: formStatus?? this.formStatus,
    );
  }
}