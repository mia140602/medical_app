abstract class SignUpEvent{}

class EmailEvent extends SignUpEvent{
  final String email;
   EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvent{
  final String password;
  PasswordEvent( this.password);
}
class SignUpSubmitted extends SignUpEvent{}