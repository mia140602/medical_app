abstract class SignInEvent{
  const SignInEvent();
}

// class SignInSubmitted extends SignInEvent{}
class EmailEvent extends SignInEvent{
  final String email;
  const EmailEvent(this.email);
}
class PasswordEvent extends SignInEvent{
  final String password;
  const PasswordEvent(this.password);
}