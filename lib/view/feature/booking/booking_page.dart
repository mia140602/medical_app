import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/bloc/booking/booking_bloc.dart';
import 'package:medical_app/bloc/booking/booking_state.dart';
import 'package:medical_app/bloc/doctor/doctor_bloc.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/model/appointment_model.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/title_section.dart';
import 'package:medical_app/widgets/flutter_toast.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../bloc/booking/booking_event.dart';
import '../../../bloc/doctor/doctor_state.dart';
import '../../../services/appointment_service.dart';
import '../../common/custom_btn.dart';


class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<String> appointments = [];
  List<String> times=[
    "9:00 AM", "9:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM",
    "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:40 PM"
  ];
 



  //declaration
  CalendarFormat _format= CalendarFormat.month;
  DateTime _focusDay= DateTime.now();
  DateTime _curentDay= DateTime.now();
  int? _currentIndex;
  bool _isWeekend=false;
  bool _dateSelected=false;
  bool _timeSelected=false;
  // List<String> time=[
  //   "9:00 AM","9:30 AM", '10:00 AM','10:30 AM','11:00 AM','11:30 AM','14:00 PM','14;30 PM','15:00 PM','15:30 PM','16:00 PM'
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state is DateSelectedState) {
            print("Ngày được lựa chọn: " + state.date);
            _dateSelected = true;
          }
          if (state is TimeSelectedState) {
            print("Thời gian được lựa chọn: " + state.time);
            _timeSelected = true;
          }
        },
      child: Container(
              padding: EdgeInsets.only(left: 20.w,top: 40.h, right: 20.w,bottom: 40),
              child: CustomScrollView(
                slivers:<Widget> [
                 SliverToBoxAdapter(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleSection(text: "Booking Appointment",),
                      SizedBox(height: 24.h,),
                      Text("Select Date",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
                      SizedBox(height: 24.h,),
                      _tableCalendar(),
                      SizedBox(height: 24.h,),
                      Text("Select Hour",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
                      SizedBox(height: 24.h,),
                    ],
                                 ),
                 ),
                 _isWeekend? SliverToBoxAdapter(
                  child:  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 39),
                    alignment: Alignment.center,
                    child:  Text("Không có lịch cuối tuần, hãy chọn lịch khác",style: appstyle(18.sp, AppColor.secondColor, FontWeight.normal),),
                  ),
                 ): SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    
                    return InkWell(
                      splashColor: Colors.transparent,
                      
                      onTap: () {
                        // //khi bấm chọn, update curentIndex và settime thành true
                        // setState(() {
                        //   _currentIndex= index;
                        //   _timeSelected=true;
                        // });
                         //khi bấm chọn, update curentIndex và settime thành true
                          String selectedTime = times[index];
                          // Send SelectTimeEvent to BookingBloc
                          // Send SelectTimeEvent to BookingBloc
                         
                          context.read<BookingBloc>().add(SelectTimeEvent(times[index]));
                          
                          
                          if (!_dateSelected) {
                            // The user has not selected a date yet, show a message to the user
                            toastInfo(msg: "Vui lòng chọn ngày trước");
                          } else if (appointments.any((appointments) {
                            print("Lịch không còn trống: " +appointments);
                            return appointments == selectedTime;
                          })) {
                            // The selected time is already booked, show a message to the user
                            toastInfo(msg: "Thời gian này đã được đặt, vui lòng chọn thời gian khác");
                          } else {
                            setState(() {
                              _currentIndex= index;
                              _timeSelected=true;
                            });
                                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _currentIndex==index?Colors.white:Colors.black
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: _currentIndex==index? AppColor.mainColor:null,
                          
                        ),
                        alignment: Alignment.center,
                        child: Text( 
                          times[index],
                        style: TextStyle(fontWeight: FontWeight.bold,
                        color: _currentIndex==index?Colors.white:null)),
                      ),
                    );
                  },
                  childCount: 12,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.5
                    )),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 50),
                        child: GestureDetector(
                          onTap: () {
                            if(_timeSelected==false){
                              toastInfo(msg: "Vui lòng chọn giờ khám");
                            }else{
                              Navigator.pushNamed(context, "/selectPackage");
                            }
                            
                          },
                          child: CustomButton(text: "Next", width: double.maxFinite, height: 50,
                          outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                          disable: _timeSelected&&_dateSelected? false:true,
                          ),
                        ),
                      ),
                    )
                 ]
              ),
      ),
    )
    );
  }

  Widget _tableCalendar(){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: AppColor.ktable
    ),
    child: TableCalendar(
      
      focusedDay: _focusDay, 
      firstDay: DateTime.now(), 
      lastDay: DateTime(2023,12,31),
      calendarFormat: _format,
      currentDay: _curentDay,
      rowHeight: 48,
      calendarStyle:  CalendarStyle(
        
        todayDecoration: BoxDecoration(
          color: AppColor.mainColor,shape: BoxShape.circle
        )
      ),
      availableCalendarFormats: const{
        CalendarFormat.month:"Month",
      },
      onFormatChanged: (format) {
        setState(() {
          _format=format;
        });
  
      },
      onDaySelected: (selectedDay, focusedDay) async {
        setState(() {
          _curentDay=selectedDay;
          _dateSelected=true;
          //kiểm tra nếu chọn vào cuối tuần
          if(selectedDay.weekday==6|| selectedDay.weekday==7){
            _isWeekend =true;
            _timeSelected=false;
            _currentIndex=null;
          } else{
            _isWeekend=false;
          }
        });
        // Fetch the appointments for the selected day and doctor
          String doctorId = (context.read<DoctorBloc>().state as DoctorSelectedState).doctor.id;
          String date = DateFormat('yyyy-MM-dd').format(selectedDay);
          // Send SelectDateEvent to BookingBloc
          context.read<BookingBloc>().add(SelectDateEvent(date));

          appointments = await fetchTimeAppointment(doctorId, date);
          print("Danh sách thời gian:");
          print(appointments);
        
      },
      ),
  );
  
}
}

