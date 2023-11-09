

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/bloc/fill_event.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/bloc/fill_state.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/fillProfile_controller.dart';

import '../../../../../services/user_service.dart';



class FillProfileBloc extends Bloc<FillProfileEvent, FillProfileState> {
  final FillProfileController controller;

  FillProfileBloc({required this.controller}) : super(FillProfileInitial()) {
    // on<GetEmailFromToken>((event, emit) async {
    //   final email = await controller.getEmailFromToken();
    //   emit(FillProfileLoaded(email: email));
    // });

    on<UpdateProfile>((event, emit) async {
  try {
    final updated = await controller.updateProfile(event.name, event.nickName, event.birthday, event.gender);
    if (updated) {
      emit(ProfileUpdated());
    } else {
      emit(ProfileUpdateFailed());
    }
  } catch (e) {
    emit(ProfileUpdateError(e.toString()));
  }
});
on<FetchUserInfo>((event, emit) async {
  try {
    final userInfo = await getUserInfo();
    emit(UserInfoFetched(userInfo: userInfo));
  } catch (e) {
    // emit(ProfileUpdateError(e.toString()));
    throw Exception(" lỗi: $e");
  }
});
//     on<GetUserInfo>((event, emit) async {
//   try {
//     final userInfo = await controller.getUser();
//     if (userInfo != null) {
//       emit(UserInfoLoaded(userInfo: userInfo));
//     } else {
//       emit(ProfileUpdateError('Flutter: lỗi khi tải userInfo'));
//     }
//   } catch (e) {
//     emit(ProfileUpdateError(e.toString()));
//   }
// });
//   on<GetUserInfo>((event, emit) async {
//   final userInfo = await controller.getUserInfo();
//   emit(UserInfoLoaded(userInfo: userInfo));
// });
  }
}

