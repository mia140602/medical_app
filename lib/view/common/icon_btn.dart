import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constains/app_constain.dart';

class IconBtn extends StatelessWidget {
  final double width;
  final double? hieght;
  String svgImg;
  final void Function()? onTap;
  final Color color;
  final Color? color2;
  IconData? icon;
 final double? size;
 final Color kBorder;
 final double radius;

   IconBtn({super.key, required this.svgImg,
   required this.width, this.hieght, this.onTap, required this.color, this.color2, this.size,required this.kBorder, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hieght,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(
          width: 1,
          color: kBorder,
        )
        
      ),
      child: Center(
        child: SvgPicture.asset("assets/icons/"+ svgImg),
      ),
    );
  }
}