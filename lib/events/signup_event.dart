abstract class SignUpEvent{}

class SignUpUseremailChanged extends SignUpEvent{
  final String useremail;
  SignUpUseremailChanged({required this.useremail});
}

class SignUpUserpasswordChanged extends SignUpEvent{
  final String userpassword;
  SignUpUserpasswordChanged({required this.userpassword});
}
class SignUpSubmitted extends SignUpEvent{}