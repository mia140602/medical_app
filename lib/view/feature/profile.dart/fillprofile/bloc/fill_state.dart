
// class FillProfileState{
//   final String token;
//   // final String email;
//   // final String password;
//   // final FormSubmissionStatus formStatus;
//   // bool get isValidPassword=> password.length>6;
//   // bool get isvalidEmail => email.contains("@");

//   FillProfileState({
//     // this.email='',
//     // this.password='',
//     this.token='',
//   // this.formStatus= const InitialFormStatus(),
//   });
//   // FillProfileState copyWith({String? email,
//   //     String? password,
//   //     // FormSubmissionStatus? formStatus,
//   // }){
//   //   return FillProfileState(
//   //     email: email?? this.email,
//   //     password: password?? this.password,
//   //     // formStatus: formStatus?? this.formStatus,
//   //   );
//   // }
// }
// class FillProfileState{
//   final String token;
//     FillProfileState({
//        this.token='',
//          });
//          }
import '../../../../../model/user_model.dart';

abstract class FillProfileState {
  final String name;
  final String nickName;
  final String birthday;
  final String gender;

  FillProfileState({this.name='',this.nickName='',this.birthday='',this.gender=''});
}

class FillProfileInitial extends FillProfileState {}

// class FillProfileLoaded extends FillProfileState {
//   final String email;

//   FillProfileLoaded({required this.email});
// }

class ProfileUpdated extends FillProfileState {}

class ProfileUpdateFailed extends FillProfileState {}

class ProfileUpdateError extends FillProfileState {
  final String error;

  ProfileUpdateError(this.error);
}
// class UserInfoLoaded extends FillProfileState {
//   final UserModel userInfo;

//   UserInfoLoaded({required this.userInfo});
// }
// class UserInfoLoaded extends FillProfileState {
//   final Map<String, dynamic> userInfo;

//   UserInfoLoaded({required this.userInfo});
// }


class UserInfoFetched extends FillProfileState {
  final UserModel userInfo;

  UserInfoFetched({required this.userInfo});
}