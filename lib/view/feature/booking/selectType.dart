import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      
      body: Container(
        color: Colors.grey.shade100,
        padding: EdgeInsets.only(left: 20.w,top: 40.h, right: 20.w,bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleSection(text: "Seclect Package",),
            SizedBox(height: 24.h,),
            Text("Select Duration",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
            SizedBox(height: 24.h,),
            Text("Thời gian tham gia tư vấn mặc định là 30'",style: appstyle(18.sp, AppColor.secondColor, FontWeight.normal),),
            SizedBox(height: 24.h,),
            Text("Select Package",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
            SizedBox(height: 24.h,),
           
            CustomRadio(value: 1, groupValue: _value, 
              svgImg: "mess.svg", titleText: "Messaging", decriptionText: "Chat messages with doctor", dolar: 20,
              onChanged: (int? value){
                setState(() {
                  _value= value!;
                });
              },
              ),
            
            SizedBox(height: 24.h,),
            CustomRadio(value: 2, groupValue: _value, 
              svgImg: "call.svg", titleText: "Voice Call", decriptionText: "Voice Call with doctor", dolar: 40,
              onChanged: (int? value){
                setState(() {
                  _value= value!;
                });
              },),
            SizedBox(height: 24.h,),
            CustomRadio(value: 3, groupValue: _value, 
              svgImg: "videoCall.svg", titleText: "Video Call", decriptionText: "Video call with doctor", dolar: 60,
              onChanged: (int? value){
                setState(() {
                  _value= value!;
                });
              },),
            SizedBox(height: 80.h,),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/patienDetail"),
              child: CustomButton(text: "Next", width: double.maxFinite, height: 50,
                            outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                            ),
            ),
          ],
        ),
      ),
    );
  }
}
