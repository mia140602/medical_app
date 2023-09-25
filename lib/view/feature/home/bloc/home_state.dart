import 'package:medical_app/model/user_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class UserInfoLoaded extends HomeState {
  final UserModel userInfo;

  UserInfoLoaded({required this.userInfo});
}

class UserInfoLoadFailed extends HomeState {}

class UserInfoLoadError extends HomeState {
  final String error;

  UserInfoLoadError(this.error);
}