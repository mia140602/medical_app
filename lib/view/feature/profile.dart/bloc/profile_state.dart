import '../../../../model/user_model.dart';

abstract class ProfileState{}

class ProfileInitial extends ProfileState{}

class UserInfoLoaded extends ProfileState {
  final UserModel userInfo;

  UserInfoLoaded({required this.userInfo});
}
class UserInfoLoadFailed extends ProfileState {}

class UserInfoLoadError extends ProfileState {
  final String error;

  UserInfoLoadError(this.error);
}