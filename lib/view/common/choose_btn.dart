import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/reusable_text.dart';

class ChooseBtn extends StatefulWidget {
  final String imagePath;
  final String text1;
  final String text2;
  final String? price;
  final String? time;
  final bool hasCheckbox;
  const ChooseBtn({super.key,required this.imagePath, required this.text1, required this.text2, this.hasCheckbox = false, this.price, this.time});

  @override
  State<ChooseBtn> createState() => _ChooseBtnState();
}

class _ChooseBtnState extends State<ChooseBtn> {
 bool isPressed = false;
  bool isChecked = false;
  int tapCount = 0;
  @override
  Widget build(BuildContext context) {
    Color borderColor = isPressed ? AppColor.mainColor : AppColor.kTextField;
    if (widget.hasCheckbox && isChecked) {
      borderColor = AppColor.mainColor;
    }

    return GestureDetector(
     onTap: () {
      if (widget.hasCheckbox){
        setState(() {
          isChecked=!isChecked;
        });
      }
        setState(() {
          isPressed = !isPressed;
        });
      },
     
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              widget.imagePath,
              width: 80.w,
              height: 80.h,
              color: AppColor.mainColor,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.text1, style: appstyle(14.sp, AppColor.secondColor, FontWeight.normal),),
                Text(widget.text2,style: appstyle(16.sp, AppColor.textColor1, FontWeight.bold),),
              ],
            ),
            
            if (widget.hasCheckbox) 
             Row(
              children: [
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text( widget.price??'', style: appstyle(18.sp, AppColor.mainColor, FontWeight.bold),),
                    Text(widget.time??"",style: appstyle(10.sp, AppColor.secondColor, FontWeight.normal),)
                  ],
                ),
                SizedBox(width: 10),
                 Checkbox(
                activeColor: AppColor.mainColor,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
                 shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10.0),
          
                ),
                side: BorderSide(color: AppColor.mainColor,width: 3),
              ),
              ],
             )
          ],
        ),
      ),
    );
  }
}