import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/services/user_service.dart';
import 'package:medical_app/view/feature/profile.dart/bloc/profile_event.dart';
import 'package:medical_app/view/feature/profile.dart/bloc/profile_state.dart';

import '../fillprofile/fillProfile_controller.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FillProfileController controller;

  ProfileBloc({required this.controller}) : super(ProfileInitial()) {
    on<ProfileGetUserInfo>((event, emit) async {
      try {
      final userInfo = await getUserInfo();
      
      if (userInfo != null) {
        emit(UserInfoLoaded(userInfo: userInfo));
      } else {
        emit(UserInfoLoadFailed());
      }
    } catch (e) {
      emit(UserInfoLoadError(e.toString()));
    }
    });
  }
}