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
// class GetUserInfo extends FillProfileEvent {}
class FetchUserInfo extends FillProfileEvent {}