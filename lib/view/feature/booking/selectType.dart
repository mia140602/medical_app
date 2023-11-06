import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/bloc/booking/booking_bloc.dart';
import 'package:medical_app/bloc/booking/booking_event.dart';
import 'package:medical_app/bloc/booking/booking_state.dart';
import 'package:medical_app/view/common/custom_radio.dart';

import '../../../config/app_constant.dart';
import '../../common/app_style.dart';

import '../../common/custom_btn.dart';
import '../../common/title_section.dart';

class SelectType extends StatefulWidget {
  const SelectType({super.key});

  @override
  State<SelectType> createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  int _value=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state is TypeSelectedState) {
            print("Loại tư vấn được chọn: " + state.type);
          }
        },
      
      child: Container(
        color: Colors.grey.shade100,
        padding: EdgeInsets.only(left: 20.w,top: 40.h, right: 20.w,bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleSection(text: "Chọn hình thức khám",),
            SizedBox(height: 24.h,),
            Text("Thời gian",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
            SizedBox(height: 24.h,),
            Text("Thời gian tham gia tư vấn mặc định là 30'",style: appstyle(18.sp, AppColor.secondColor, FontWeight.normal),),
            SizedBox(height: 24.h,),
            Text("Chọn hình thức",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
            SizedBox(height: 24.h,),
           
            CustomRadio(value: 1, groupValue: _value, 
              svgImg: "mess.svg", titleText: "Nhắn tin", decriptionText: "Nhắn tin với bác sĩ", dolar: 20,
              onChanged: (int? value){
                setState(() {
                  _value= value!;
                });
                context.read<BookingBloc>().add(SelectTypeEvent('chat'));
              },
              ),
            
            SizedBox(height: 24.h,),
            CustomRadio(value: 2, groupValue: _value, 
              svgImg: "call.svg", titleText: "Voice Call", decriptionText: "Voice Call với bác sĩ", dolar: 40,
              onChanged: (int? value){
                setState(() {
                  _value= value!;
                });
                context.read<BookingBloc>().add(SelectTypeEvent('voiceCall'));
              },),
            SizedBox(height: 24.h,),
            CustomRadio(value: 3, groupValue: _value, 
              svgImg: "videoCall.svg", titleText: "Video Call", decriptionText: "Video call với bác sĩ", dolar: 60,
              onChanged: (int? value){
                setState(() {
                  _value= value!;
                });
                context.read<BookingBloc>().add(SelectTypeEvent('videoCall'));
              },),
            SizedBox(height: 80.h,),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/patienDetail"),
              child: CustomButton(text: "Tiếp tục", width: double.maxFinite, height: 50,
                            outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                            ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
