import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/appointment_cart.dart';
import 'package:medical_app/view/common/title_section.dart';
import 'package:medical_app/view/feature/appointment/bloc/appointment_state.dart';

import 'bloc/appointment_bloc.dart';
import 'bloc/appointment_event.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

enum FilterStatus {upcoming,unconfimred,cancel}
enum FilterType {Messaging, Video, Call,Offline}

class _AppointmentScreenState extends State<AppointmentScreen> {
  late AppointmentBloc _appointmentBloc;

  @override
  void initState() {
    super.initState();
    _appointmentBloc = context.read<AppointmentBloc>();
    _appointmentBloc.add(LoadAppointments());
  }

  FilterStatus status= FilterStatus.upcoming; //trạng thái ban đầu
  FilterType type= FilterType.Messaging;
  String btn1="Book again";
  String btn2="Reschedule";
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
                            for(FilterStatus filterStatus in FilterStatus.values)
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (filterStatus== FilterStatus.upcoming){
                                        status= FilterStatus.upcoming;
                                        _alignment= Alignment.centerLeft;
                                        btn1="Cancel Appointment";
                                        btn2="Reschedule";
                                      } else if(filterStatus== FilterStatus.unconfimred){
                                        status=FilterStatus.unconfimred;
                                        _alignment=Alignment.center;
                                        btn1="Book again";
                                        btn2="Leave a review";
                                      } else if(filterStatus== FilterStatus.cancel){
                                        status=FilterStatus.cancel;
                                        _alignment=Alignment.centerRight;
                                        btn1="Book again";
                                        btn2="Delete";
                                      }
                                    });
                                  },
                                  child: Center(
                                    child: Text(filterStatus.name,style: appstyle(15.sp, AppColor.secondColor, FontWeight.w600),),
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
                              status.name,
                              style: appstyle(15.sp, Colors.white, FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ]
                  ),
                  SizedBox(height: 24.h,),
                 Center(child: Text("Bạn chưa có cuộc hẹn nào, vui lòng đặt lịch để sử dụng")),
                ],
              ),
            ),
          );
          }else{

          // Now you can use `appointments` to build your UI.
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
                            for(FilterStatus filterStatus in FilterStatus.values)
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (filterStatus== FilterStatus.upcoming){
                                        status= FilterStatus.upcoming;
                                        _alignment= Alignment.centerLeft;
                                        
                                      } else if(filterStatus== FilterStatus.unconfimred){
                                        status=FilterStatus.unconfimred;
                                        _alignment=Alignment.center;
                                       
                                      } else if(filterStatus== FilterStatus.cancel){
                                        status=FilterStatus.cancel;
                                        _alignment=Alignment.centerRight;
                                       
                                      }
                                    });
                                  },
                                  child: Center(
                                    child: Text(filterStatus.name,style: appstyle(15.sp, AppColor.secondColor, FontWeight.w600),),
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
                              status.name,
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
                        switch (status) {
                          case FilterStatus.upcoming:
                            return appointment.status == "Xác nhận";
                          case FilterStatus.unconfimred:
                            return appointment.status == "Chưa xác nhận";
                          case FilterStatus.cancel:
                            return appointment.status == "Từ chối";
                          default:
                            return false;
                        }
                      }).toList().length,
                      itemBuilder: ((context, index) {
                        var appointment = appointments.where((appointment) {
                          switch (status) {
                            case FilterStatus.upcoming:
                              return appointment.status == "Xác nhận";
                            case FilterStatus.unconfimred:
                              return appointment.status == "Chưa xác nhận";
                            case FilterStatus.cancel:
                              return appointment.status == "Từ chối";
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
                            child: AppointmentCart(
                              
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
          return Text('Something went wrong!');
        }
      }
    );
  }
}