import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view/feature/appointment/appointment_screen.dart';

double height = 812.h;
double width = 375.w;
// 
// final url='http://192.168.1.8:8000/';
// final url='http://192.168.5.24:8000/';
// final url= ''

//ở trường:
// final url='http://172.16.39.170:8000/';
//cty
final url='http://192.168.5.18:8000/';

final registration= url+"registration";
final login= url+"login";
final updateUserProfile= url +"updateProfile";
final getUserProfileInfo= url+"/getUserInfo";



class AppColor {
  static final Color mainColor= Color(0xff4285F4);
  static final Color textColor1= Color(0xff212121);
  static final Color secondColor= Color(0xff9E9E9E);
  static final Color kTextField = Colors.grey.shade200;
  static final Color kBorder= Color(0xffEEEEEE);
  static final Color ktable= Color(0xFFEEF4FF);
  

}
class AppConstants{
 static const String STORAGE_DEVICE_OPEN_FIRST_TIME='device_first_open';
  static const String STORAGE_USER_TOKEN_KEY="user_token_key";
  static const String STORAGE_USER_PROFILE_KEY="user_profile_key";
}
extension FilterStatusExtension on FilterStatus {
  String get displayName {
    switch (this) {
      case FilterStatus.upcoming:
        return "Upcoming";
      case FilterStatus.completed:
        return "Completed";
      case FilterStatus.cancel:
        return "Cancelled";
      default:
        return "";
    }
  }
}
extension FilterTypeExtension on FilterType {
  String get displayName {
    switch (this) {
      case FilterType.Call:
        return "Voice Call";
      case FilterType.Video:
        return "Video Call";
      case FilterType.Messaging:
        return "Messaging";
      case FilterType.Offline:
        return "Offline";
      default:
        return "";
    }
  }
  String get imgPath{
    switch (this){
      case FilterType.Call:
        return "assets/icons/call.svg";
      case FilterType.Video:
        return "assets/icons/videoCall.svg";
      case FilterType.Messaging:
        return "assets/icons/mess.svg";
      case FilterType.Offline:
        return "assets/icons/mess.svg";
      default:
        return "assets/icons/mess.svg";
    }
  }
}


