

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/reusable_text.dart';

import 'app_style.dart';

class StarRate extends StatelessWidget {
  final String star;
  final Color? color;

  const StarRate({super.key, required this.star, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    margin: EdgeInsets.only(right: 10),
    width: 50.w,

    height: 34.h,
    decoration: BoxDecoration(
      
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(50),),
      border: Border.all(width: 2, color: AppColor.mainColor)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
        Icon(Ionicons.star, color: AppColor.mainColor, size: 10,),
        SizedBox(width: 5.w,),
        ReusableText(text: star,
       style: appstyle(12,AppColor.mainColor, FontWeight.w600),),
       


       ]
    ),
    );
  }
}