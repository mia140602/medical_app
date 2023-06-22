import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/view/common/reusable_text.dart';

import 'app_style.dart';


class CustomOutlineBtn extends StatelessWidget {
 CustomOutlineBtn({super.key,required this.svgImg,
  this.haveText=true,required this.width, this.hieght,  this.text, this.onTap, required this.color, this.color2, this.size=16, this.textColor});
  final double width;
  final double? hieght;
  final String? text;
  String svgImg;
  final void Function()? onTap;
  final Color color;
  final Color? color2;
  
  bool? haveText;
 final double? size;
 final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: hieght,
        decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          border: Border.all(
            width: 1,
            color: color
          )
        ),
        child: haveText==false? Center(
          child: SvgPicture.asset("assets/icons/"+svgImg),
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/"+svgImg),
              SizedBox(width: 20,),
              ReusableText(text: text!, style: appstyle(size!, textColor!, FontWeight.w500))
            ],
        )
      ),
    );
  }
}