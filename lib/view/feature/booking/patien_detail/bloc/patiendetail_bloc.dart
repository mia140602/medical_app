import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/view/feature/booking/patien_detail/bloc/partiendetail_event.dart';
import 'package:medical_app/view/feature/booking/patien_detail/bloc/patiendetail_state.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/fillProfile_controller.dart';

class PatienDetailBloc extends Bloc<PatienDetailEvent, PatienDetailState> {
  final FillProfileController controller;

  PatienDetailBloc({required this.controller}) : super(PatienDetailInitial()) {
    on<PatienGetInfo>((event, emit) async {
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