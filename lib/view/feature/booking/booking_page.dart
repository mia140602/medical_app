import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/title_section.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../common/custom_btn.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {




  //declaration
  CalendarFormat _format= CalendarFormat.month;
  DateTime _focusDay= DateTime.now();
  DateTime _curentDay= DateTime.now();
  int? _currentIndex;
  bool _isWeekend=false;
  bool _dateSelected=false;
  bool _timeSelected=false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                        //khi bấm chọn, update curentIndex và settime thành true
                        setState(() {
                          _currentIndex= index;
                          _timeSelected=true;
                        });
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
                        child: Text('${index+9}:00${index +9>11?"PM":"AM"}',
                        style: TextStyle(fontWeight: FontWeight.bold,
                        color: _currentIndex==index?Colors.white:null)),
                      ),
                    );
                  },
                  childCount: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.5
                    )),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 50),
                        child: CustomButton(text: "Next", width: double.maxFinite, height: 50,
                        outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                        disable: _timeSelected&&_dateSelected? false:true,
                        ),
                      ),
                    )
                 ]
              ),
      ),
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
      onDaySelected: (selectedDay, focusedDay) {
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
      },
      ),
  );
}
}

