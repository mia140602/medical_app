import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/view/feature/home/bloc/home_event.dart';
import 'package:medical_app/view/feature/home/bloc/home_state.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/fillProfile_controller.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FillProfileController controller;

  HomeBloc({required this.controller}) : super(HomeInitial()) {
    on<HomeGetUserInfo>((event, emit) async {
      try {
      final userInfo = await controller.getUser();
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