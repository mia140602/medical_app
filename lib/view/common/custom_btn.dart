
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/reusable_text.dart';

class CustomButton extends StatelessWidget {
  
  double width;
  double? height;
  final String text;
  final Color? color;
  double radius;
  final Color outlineBtnColor;
  // final void Function()? onTap;
  final Color? textColor;
  final bool wrapContentWidth;
  final double? textSize;
  final bool? disable;

  CustomButton({super.key, this.radius=100, this.height, this.wrapContentWidth=false,
  required this.text, this.color, 
  this.disable= false,
  // this.onTap
  required this.width,required this.outlineBtnColor, this.textColor, this.textSize=16
  });
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    margin: EdgeInsets.only(right: 10),
    width: wrapContentWidth? null: width,
    height: height,
    decoration: BoxDecoration(
      
      color: disable==true?AppColor.kTextField: color,
      borderRadius: BorderRadius.all(Radius.circular(radius),),
      border: Border.all(width: 1, color:disable==true?Colors.black: outlineBtnColor)
    ),
    child: Center(
       child: ReusableText(text: text,
       style: appstyle(textSize??16,disable==true?AppColor.secondColor: textColor!, FontWeight.w600),),
    ),
    );
  }
}