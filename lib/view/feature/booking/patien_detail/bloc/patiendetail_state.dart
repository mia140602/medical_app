

import '../../../../../model/user_model.dart';

abstract class PatienDetailState{}

class PatienDetailInitial extends PatienDetailState{}

class UserInfoLoaded extends PatienDetailState {
  final UserModel userInfo;

  UserInfoLoaded({required this.userInfo});
}
class UserInfoLoadFailed extends PatienDetailState {}

class UserInfoLoadError extends PatienDetailState {
  final String error;

  UserInfoLoadError(this.error);
}