import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view/feature/appointment/appointment_screen.dart';

double height = 812.h;
double width = 375.w;
//
final url = 'http://172.16.67.57:3000';

final registration = url + "/registration";
final login = url + "/userLogin";
final updateUserProfile = url + "/updateProfile";
final getUserProfileInfo = url + "/getUserInfo";
//chat
final createChat = url + '/userCreateChat';
final getChat = url + '/getChat';
//message ( sửa cả ở mess helper huhu)
final userSendMess = url + '/userSendMessage';
final userMess = url + '/userMessage/'; // cái này ở mess helper
final getAppointmentMess = url + '/messages';

//doctor
final getDoctor = url + '/api/doctors';

// appointment
final getDoctorAppointment = url + '/api/appointments/doctorAppointment';
final userCreatAppointment = url + '/api/appointments/creatAppointment';
final usergetAppointment = url + '/api/appointments';
//department
final getAllDepartment = url + '/api/departments/getAllDepartment';
final getDepartmentDoctor = url + '/api/departments/getDoctorsByDepartment';

//notification
final getnotification = url + '/notification';

//Meeting
final userJoinMeeting = url + '/api/meeting/join';
final userGetMeeting = url + '/api/meeting';

//review
final userpostReview = url + '/api/reviews';

class AppColor {
  static final Color mainColor = Color(0xff4285F4);
  static final Color textColor1 = Color(0xff212121);
  static final Color secondColor = Color(0xff9E9E9E);
  static final Color kTextField = Colors.grey.shade200;
  static final Color kBorder = Color(0xffEEEEEE);
  static final Color ktable = Color(0xFFEEF4FF);
}

class AppConstants {
  static const String STORAGE_DEVICE_OPEN_FIRST_TIME = 'device_first_open';
  static const String STORAGE_USER_TOKEN_KEY = "user_token_key";
  static const String STORAGE_USER_PROFILE_KEY = "user_profile_key";
}

extension FilterStatusExtension on FilterStatus {
  String get displayName {
    switch (this) {
      case FilterStatus.upcoming:
        return "Upcoming";
      case FilterStatus.unconfimred:
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

      default:
        return "";
    }
  }

  String get imgPath {
    switch (this) {
      case FilterType.Call:
        return "assets/icons/call.svg";
      case FilterType.Video:
        return "assets/icons/videoCall.svg";
      case FilterType.Messaging:
        return "assets/icons/mess.svg";

      default:
        return "assets/icons/mess.svg";
    }
  }
}
