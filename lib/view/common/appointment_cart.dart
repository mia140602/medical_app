import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/services/meeting_service.dart';
import 'package:medical_app/widgets/flutter_toast.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../config/app_constant.dart';
import '../../model/appointment_model.dart';
import '../../model/meeting_model.dart';
import '../feature/meeting/chat/chat_page.dart';
import 'app_style.dart';
import 'custom_btn.dart';

class AppointmentCart extends StatelessWidget {

  final AppointmentModel appointment;
  String imgPath;
  String doctorName;
  String department;
  String? status; // Change FilterStatus to AppointmentStatus
  String type; // Change FilterType to String
  
 
  String time;
  String date;
 AppointmentCart({super.key, required this.doctorName, 
      required this.imgPath, required this.department, 
      this.status, required this.type,
      required this.time, required this.date,
      
      required this.appointment
      });

  @override
  Widget build(BuildContext context) {
    String getIconPath(String type) {
        switch (type) {
          case 'chat':
            return "assets/icons/mess.svg";
          case 'videoCall':
            return "assets/icons/videoCall.svg";
          case 'voiceCall':
            return "assets/icons/call.svg";
          default:
            return "assets/icons/default.svg"; // return a default icon if type is not recognized
        }
      }
    return Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(image: NetworkImage(imgPath))
                    ),
                  ),
                  SizedBox(width:10.w ,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          style: appstyle(18, AppColor.textColor1, FontWeight.bold),

                        ),
                        Row(
                          children: [
                            Text(
                              type, // Use type directly
                              style: appstyle(12.sp, AppColor.textColor1, FontWeight.normal),
                            ),
                            Text(" - "),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: AppColor.mainColor)
                              ),
                              child: Text(
                                department, // Convert status to string
                                style: appstyle(12.sp, AppColor.mainColor, FontWeight.normal),
                              ),
                            ),
                            
                          ],
                        ),
                        Divider(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: AppColor.mainColor)
                              ),
                              child: Text(
                                time, // Convert status to string
                                style: appstyle(12.sp, AppColor.mainColor, FontWeight.normal),
                              ),
                            ),
                            Text(" | "),
                            Text(
                              date, // Use type directly
                              style: appstyle(12.sp, AppColor.textColor1, FontWeight.normal),
                            ),
                            
                            

                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  SvgPicture.asset(getIconPath(type),color: AppColor.mainColor,width: 56.w,)
                  // SvgPicture.asset("assets/icons/mess.svg",color: AppColor.mainColor,width: 56.w,)
                ],
              ),
              Container(
              margin: EdgeInsets.symmetric(vertical: 10), // Khoảng cách trên và dưới đường kẻ ngang
              child: Container(
                height: 1, // Chiều cao của đường kẻ ngang
                color: Colors.grey.withOpacity(0.5), // Màu nền mờ của đường kẻ ngang
              ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  // CustomButton(
                  //   text: textBtn1, 
                  //   width: 140.w, 
                  //   // wrapContentWidth: true,
                  //   height: 30.h,
                  //   outlineBtnColor: AppColor.mainColor,
                  //   textColor: AppColor.mainColor,
                  //   textSize: 14.sp,
                  //   ),
                   if (status=="Xác nhận") 
                     GestureDetector(
                      onTap: () async {
                         // Chuyển đổi date và time thành DateTime
                          DateFormat format = DateFormat("yyyy-MM-dd h:mm a");
                          DateTime appointmentStartTime = format.parse('${appointment.date} ${appointment.time}');
                          DateTime appointmentEndTime = appointmentStartTime.add(Duration(minutes: 30));

                          if (DateTime.now().isBefore(appointmentStartTime)) {
                            // Nếu chưa đến thời gian bắt đầu, hiển thị thông báo toast và không làm gì cả
                            toastInfo(msg: "Cuộc hẹn chưa bắt đầu");
                            return;
                          } else if (DateTime.now().isAfter(appointmentEndTime)) {
                            // Nếu đã qua thời gian kết thúc, hiển thị thông báo toast và không làm gì cả
                            toastInfo(msg: "Cuộc họp đã kết thúc");
                            return;
                          
                          }
                         if (type == "chat") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChatPage(appointment: appointment,)),
                            );
                         } 
                        else if (type == "videoCall" || type=="voiceCall") {
                          // Fetch the meeting model from the server
                          MeetingModel meetingModel = await MeetingService.fetchMeetingModel(appointment.id);
                          String zoomMeetingUrl = meetingModel.zoomMeetingUrl;
                          // await MeetingService().joinMeeting(appointment.id, meetingModel.user, socketId);
                          // Open the Zoom meeting URL in the default browser
                          if (await canLaunchUrl(Uri.parse(zoomMeetingUrl))) {
                                await launchUrl(Uri.parse(zoomMeetingUrl));
                              } else {
                                throw 'Could not launch $zoomMeetingUrl';
                              }
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => MeetingPage(appointmentId: appointment.id, meetingModel: meetingModel)),
                          // );
} 
                      },
                       child: CustomButton(
                                         text: "Tham gia tư vấn", 
                                         width: 200.w, 
                                         // wrapContentWidth: true,
                                         height: 30.h,
                                         outlineBtnColor: AppColor.mainColor,
                                         textColor: Colors.white,
                                         color: AppColor.mainColor,
                                         textSize: 14.sp,
                                         
                                         ),
                     ),

                ],
              )
            ],
          );
  }
}