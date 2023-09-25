// // fillProfile_event.dart

abstract class FillProfileEvent {}

class GetEmailFromToken extends FillProfileEvent {}
class UpdateProfile extends FillProfileEvent {
  final String name;
  final String nickName;
  final String birthday;
  final String gender;

  UpdateProfile({required this.name, required this.nickName, required this.birthday, required this.gender});
}
class GetUserInfo extends FillProfileEvent {}
// abstract class FillProfileEvent {}

// class LoadProfileEvent extends FillProfileEvent {}

// class UpdateProfileEvent extends FillProfileEvent {
//   final String name;
//   final String nickName;
//   final String dateBirthday;
//   final String gender;

//   UpdateProfileEvent({
//     required this.name,
//     required this.nickName,
//     required this.dateBirthday,
//     required this.gender,
//   });
// }
// class UpdateTokenEvent extends FillProfileEvent {
//   final String token;

//   UpdateTokenEvent(this.token);
// }
// abstract class SignInEvent{
//   const SignInEvent();
// }

// class SignInSubmitted extends SignInEvent{}
// class EmailEvent extends SignInEvent{
//   final String email;
//   const EmailEvent(this.email);
// }
// class PasswordEvent extends SignInEvent{
//   final String password;
//   const PasswordEvent(this.password);
// }