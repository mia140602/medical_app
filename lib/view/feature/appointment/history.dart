import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/appointment_cart.dart';
import 'package:medical_app/view/common/title_section.dart';
import 'package:medical_app/view/feature/appointment/bloc/appointment_state.dart';
import 'package:medical_app/view/feature/appointment/reviewScreen.dart';

import '../../../model/appointment_model.dart';
import '../../common/custom_btn.dart';
import 'bloc/appointment_bloc.dart';
import 'bloc/appointment_event.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

// enum FilterStatus {upcoming,unconfimred,cancel}
enum FilterType {Messaging, Call,Video}

class _HistoryScreenState extends State<HistoryScreen> {
  late AppointmentBloc _appointmentBloc;

  @override
  void initState() {
    super.initState();
    _appointmentBloc = context.read<AppointmentBloc>();
    _appointmentBloc.add(LoadAppointments());
  }

  // FilterStatus status= FilterStatus.upcoming; //trạng thái ban đầu
  FilterType typeAppointment= FilterType.Messaging;
 
  Alignment _alignment= Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc,AppointmentState>(
      builder: (context, state) {
        if (state is AppointmentLoading) {
          return CircularProgressIndicator();
        } else if (state is AppointmentsLoaded) {
          final appointments = state.appointments;
          if (appointments.isEmpty) {
            return Scaffold(
            body: Container(
              margin: EdgeInsets.only(top: 24.h, left: 20.w, right: 20.w, bottom: 30.h),
              child: Column(
                children: [
                  TitleSection(text: "My Appointment", imagePaths: ["Search.svg","more.svg"],),
                  SizedBox(height: 24.h,),
                  Stack(
                    children:[
                      Container(
                        width: double.maxFinite,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            for(FilterType filterType in FilterType.values)
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (filterType== FilterType.Messaging){
                                        typeAppointment= FilterType.Messaging;
                                        _alignment= Alignment.centerLeft;
                                      
                                      } else if(filterType== FilterType.Call){
                                        typeAppointment=FilterType.Call;
                                        _alignment=Alignment.center;
                                 
                                      } else if(filterType== FilterType.Video){
                                        typeAppointment=FilterType.Video;
                                        _alignment=Alignment.centerRight;
                                        
                                      }
                                    });
                                  },
                                  child: Center(
                                    child: Text(filterType.name,style: appstyle(15.sp, AppColor.secondColor, FontWeight.w600),),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      AnimatedAlign(alignment: _alignment, duration: const Duration(microseconds: 200),
                        child: Container(
                          width: 110.w,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              typeAppointment.name,
                              style: appstyle(15.sp, Colors.white, FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ]
                  ),
                  SizedBox(height: 24.h,),
                 Center(child: Text("chưa có lịch sử")),
                ],
              ),
            ),
          );
          }else{

          
          return Scaffold(
            body: Container(
              margin: EdgeInsets.only(top: 24.h, left: 20.w, right: 20.w, bottom: 30.h),
              child: Column(
                children: [
                  TitleSection(text: "Lịch sử", imagePaths: ["Search.svg","more.svg"],),
                  SizedBox(height: 24.h,),
                  Stack(
                    children:[
                      Container(
                        width: double.maxFinite,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            for(FilterType filterType in FilterType.values)
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (filterType== FilterType.Messaging){
                                        typeAppointment= FilterType.Messaging;
                                        _alignment= Alignment.centerLeft;
                                        
                                       } else if(filterType== FilterType.Call){
                                        typeAppointment=FilterType.Call;
                                        _alignment=Alignment.center;
                                 
                                      } else if(filterType== FilterType.Video){
                                        typeAppointment=FilterType.Video;
                                        _alignment=Alignment.centerRight;
                                        
                                      }
                                    });
                                  },
                                  child: Center(
                                    child: Text(filterType.name,style: appstyle(15.sp, AppColor.secondColor, FontWeight.w600),),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      AnimatedAlign(alignment: _alignment, duration: const Duration(microseconds: 200),
                        child: Container(
                          width: 110.w,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              typeAppointment.name,
                              style: appstyle(15.sp, Colors.white, FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ]
                  ),
                  SizedBox(height: 24.h,),
                 Expanded(
                    child: ListView.builder(
                      itemCount: appointments.where((appointment) {


                          DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                        DateTime date = dateFormat.parse(appointment.date);

                        DateFormat timeFormat = DateFormat("h:mm a");
                        DateTime time = timeFormat.parse(appointment.time);

                        DateTime appointmentStartTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                        DateTime appointmentEndTime = appointmentStartTime.add(Duration(minutes: 30));
                         

                        switch (typeAppointment) {
                          
                          case FilterType.Messaging:
                            return appointment.type == "chat" && DateTime.now().isAfter(appointmentEndTime);
                          case FilterType.Call:
                            return appointment.type == "voiceCall" && DateTime.now().isAfter(appointmentEndTime);
                          case FilterType.Video:
                            return appointment.type == "videoCall" && DateTime.now().isAfter(appointmentEndTime);
                          default:
                            return false;
                        }
                      }).toList().length,
                      itemBuilder: ((context, index) {
                        var appointment = appointments.where((appointment) {
                           DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                        DateTime date = dateFormat.parse(appointment.date);

                        DateFormat timeFormat = DateFormat("h:mm a");
                        DateTime time = timeFormat.parse(appointment.time);

                        DateTime appointmentStartTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                        DateTime appointmentEndTime = appointmentStartTime.add(Duration(minutes: 30));
                       

                         switch (typeAppointment) {
                          
                          case FilterType.Messaging:
                            return appointment.type == "chat" && DateTime.now().isAfter(appointmentEndTime);
                          case FilterType.Call:
                            return appointment.type == "voiceCall" && DateTime.now().isAfter(appointmentEndTime);
                          case FilterType.Video:
                            return appointment.type == "videoCall" && DateTime.now().isAfter(appointmentEndTime);
                          default:
                            return false;
                        }
                        }).toList()[index];
                        bool isLastElement = appointments.length +1 == index;
                        return Card(
                          shape: RoundedRectangleBorder(
                            side:  BorderSide(
                              color: AppColor.kTextField,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: !isLastElement
                            ?const EdgeInsets.only(bottom: 20): EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: _AppointmentCart(
                              
                              doctorName: appointment.doctor.userName, 
                              imgPath: appointment.doctor.avatar?? 'https://i.imgur.com/zj9vg2n.png', 
                              department: appointment.doctor.department??'Chưa xác định', 
                              time: appointment.time,
                              date: appointment.date,
                              type: appointment.type,
                              status: appointment.status,
                              appointment: appointment,
                              
                              
                            ),
                          ),
                        );
                      }) 
                    ),
                  )
                ],
              ),
            ),
          );
          }
        } else {
          return Text('CÓ lỗi xảy ra!');
        }
      }
    );
  }
}


class _AppointmentCart extends StatelessWidget {

  final AppointmentModel appointment;
  String imgPath;
  String doctorName;
  String department;
  String? status; // Change FilterStatus to AppointmentStatus
  String type; // Change FilterType to String
  
 
  String time;
  String date;
 _AppointmentCart({super.key, required this.doctorName, 
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
                   
                     GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReviewScreen(appointment: appointment)),
                        ),
                       child: CustomButton(
                                         text: "Đánh giá", 
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