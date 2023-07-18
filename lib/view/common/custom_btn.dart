
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:medical_app/constains/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/reusable_text.dart';

class CustomButton extends StatelessWidget {
  
  double width;
  double? height;
  final String text;
  final Color? color;
  double radius;
  final Color outlineBtnColor;
  final void Function()? onTap;
  final Color? textColor;
  final bool wrapContentWidth;

  CustomButton({super.key, this.radius=100, this.height, this.wrapContentWidth=false,
  required this.text, this.color, this.onTap,required this.width,required this.outlineBtnColor, this.textColor
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(right: 10),
      width: wrapContentWidth? null: width,
      height: height,
      decoration: BoxDecoration(
        
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius),),
        border: Border.all(width: 1, color: outlineBtnColor)
      ),
      child: Center(
         child: ReusableText(text: text,
         style: appstyle(16, textColor!, FontWeight.w600),),
      ),
    ));
  }
}