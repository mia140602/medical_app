

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/bloc/fill_event.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/bloc/fill_state.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/fillProfile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../model/user_model.dart';


// class FillProfileBloc extends Bloc<FillProfileEvent, FillProfileState>{
//   FillProfileBloc():super( FillProfileState()){
//     on<UpdateTokenEvent>((event, emit) {
//       emit(FillProfileState(token: event.token));
//     },);
//     // on<EmailEvent>(_emailEvent);
//     // on<PasswordEvent>(_passwordEvent);
//   // }
//   // void _emailEvent(EmailEvent event, Emitter<FillProfileState> emit) {
//   //   emit(state.copyWith(email: event.email));
//   //   // print("My email: ${event.email}");
//   // }
//   // void _passwordEvent(PasswordEvent event, Emitter<FillProfileState> emit) {
//   //   emit(state.copyWith(password: event.password));
//   //   // print("My password: ${event.password}");

//   }
// }
class FillProfileBloc extends Bloc<FillProfileEvent, FillProfileState> {
  final FillProfileController controller;

  FillProfileBloc({required this.controller}) : super(FillProfileInitial()) {
    on<GetEmailFromToken>((event, emit) async {
      final email = await controller.getEmailFromToken();
      emit(FillProfileLoaded(email: email));
    });
//    on<UpdateProfile>((event, emit) async {
//       final prefs = await SharedPreferences.getInstance();
//     final email = prefs.getString('email') ?? '';
//   UserModel user = UserModel(
//     email:email ,
//     name: event.name,
//     nickName: event.nickName,
//     birthday: event.birthday,
//     gender: event.gender,
//   );
//   await controller.updateProfile(user);
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
    on<GetUserInfo>((event, emit) async {
  try {
    final userInfo = await controller.getUser();
    if (userInfo != null) {
      emit(UserInfoLoaded(userInfo: userInfo));
    } else {
      emit(ProfileUpdateError('Failed to load user info'));
    }
  } catch (e) {
    emit(ProfileUpdateError(e.toString()));
  }
});
//   on<GetUserInfo>((event, emit) async {
//   final userInfo = await controller.getUserInfo();
//   emit(UserInfoLoaded(userInfo: userInfo));
// });
  }
}

