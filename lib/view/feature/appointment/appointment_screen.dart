
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/appointment_cart.dart';
import 'package:medical_app/view/common/title_section.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}
//enum cho trạng thái appointment
enum FilterStatus {upcoming,completed,cancel}
enum FilterType {Messaging, Video, Call,Offline}

class _AppointmentScreenState extends State<AppointmentScreen> {
  FilterStatus status= FilterStatus.upcoming; //trạng thái ban đầu
  FilterType type= FilterType.Messaging;
  String btn1="Book again";
  String btn2="Reschedule";
  Alignment _alignment= Alignment.centerLeft;

  List<dynamic> schedules=[
    {
      "doctor_name":"Richard Tan",
      "doctor_profile": "assets/img/doctor1.png",
      "category":"Dental",
      "type":FilterType.Messaging,
      "status": FilterStatus.upcoming,
      
    },
    {
      "doctor_name":"Max Lim",
      "doctor_profile": "assets/img/doctor2.png",
      "category":"Cadiology",
      "type":FilterType.Video,
      "status": FilterStatus.completed,

    },
    {
      "doctor_name":"Jane Wong",
      "doctor_profile": "assets/img/doctor3.png",
      "category":"Respiration",
      "type": FilterType.Call,
      "status": FilterStatus.cancel,
    },
    {
      "doctor_name":"Jenny Tran",
      "doctor_profile": "assets/img/doctor4.png",
      "category":"General",
      "type":FilterType.Offline,
      "status": FilterStatus.upcoming,
    },
    // {
    //   "doctor_name":"Richard Tan",
    //   "doctor_profile": "assets/img/doctor1.png",
    //   "category":"Dental",
    //   "status": "upcomming",
    // },


  ];
 
  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules=schedules.where((var schedule) {
      return schedule['status']==status ;
      // && schedule['type']==type;
    }).toList() ;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 24.h, left: 20.w, right: 20.w, bottom: 30.h),
        child: Column(
          children: [
            TitleSection(text: "My Appointment", imagePaths: ["Search.svg","more.svg"],),
            SizedBox(height: 24.h,),
            Stack(
              children:[ Container(
                width: double.maxFinite,
                height: 40.h,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //Filter tab
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
                              } else if(filterStatus== FilterStatus.completed){
                                status=FilterStatus.completed;
                                _alignment=Alignment.center;
                                btn1="Book again";
                                btn2="Leave a review";
                              } else if(filterStatus== FilterStatus.cancel){
                                status=FilterStatus.cancel;
                                _alignment=Alignment.centerRight;
                                btn1="Book again";
                                btn2="Delete";
                              }
                            }
                            
                            );
                          },
                          child: Center(
                            child: Text(filterStatus.name,style: appstyle(18.sp, AppColor.secondColor, FontWeight.w600),),
                          ),
                        ),
                      )
                    
                  ],
                ),
                
            
              ),
              AnimatedAlign(alignment: _alignment, duration: const Duration(microseconds: 200),
            child: Container(
              width: 100.w,
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  status.name,
                  style: appstyle(18.sp, Colors.white, FontWeight.bold),
                ),
              ),
            ),
            )
              ]
            ),
            SizedBox(height: 24.h,),

            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index) {
                  var _schedule= filteredSchedules[index];
                  bool isLastElement= filteredSchedules.length +1== index;
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
                        doctorName: _schedule['doctor_name'], 
                        imgPath: _schedule['doctor_profile'], 
                        category: _schedule['category'], 
                        status: _schedule['status'], type: _schedule['type'],
                        textBtn1: btn1,
                        textBtn2: btn2,
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
}