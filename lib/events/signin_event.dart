abstract class SignInEvent{}

class SignInUseremailChanged extends SignInEvent{
  final String useremail;
  SignInUseremailChanged({required this.useremail});
}

class SignInUserpasswordChanged extends SignInEvent{
  final String userpassword;
  SignInUserpasswordChanged({required this.userpassword});
}
class SignInSubmitted extends SignInEvent{}