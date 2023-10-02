import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/app_style.dart';



class CustomRadio extends StatefulWidget {
   int value;
   int groupValue;
   void Function(int?)? onChanged;
   String svgImg;
   String titleText;
   String decriptionText;
   int dolar;
   


  CustomRadio({super.key , 
    required this.value, required this.groupValue,
    this.onChanged,
    required this.svgImg,
    required this.titleText,
    required this.decriptionText,
    required this.dolar
    });

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool selected= widget.value != widget.groupValue; //selected = true nếu value khác groupvalue
        if(selected){
          //gửi widget.value in param
          widget.onChanged!(widget.value);
        }
      },
      child: Container(
        height: 100.h,
        width: double.maxFinite,
        
        decoration:const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24))
        ),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset("assets/icons/${widget.svgImg}",width: 60.w,color: AppColor.mainColor,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.titleText,style: appstyle(16.sp, AppColor.textColor1, FontWeight.w700),),
                SizedBox(height: 10.h,),
                Text(widget.decriptionText,style: appstyle(12.sp, AppColor.textColor1, FontWeight.normal),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("\$"+"${widget.dolar}",style: appstyle(18.sp, AppColor.mainColor, FontWeight.w700),),
                SizedBox(height: 10.h,),
                Text('/30 mins',style: appstyle(10.sp, AppColor.textColor1, FontWeight.normal),)
              ],
            ),
            Container(
              height: 20.h,
              width: 20.w,
              decoration: BoxDecoration(
                color: widget.value== widget.groupValue? AppColor.mainColor: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.mainColor,width: 2)
              ),
            )
            
    
    
          ],
        ),
      ),
    );
  }
}