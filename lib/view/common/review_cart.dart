import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/avt.dart';
import 'package:medical_app/view/common/star_rate.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             CircleAvatar(backgroundImage: AssetImage("assets/img/avt1.png"),),
             Text("Tui La bup be than yeu",style: appstyle(16.sp, AppColor.textColor1, FontWeight.bold),
             
             ),
             StarRate(star: "5"),
             SvgPicture.asset("assets/icons/more.svg")
            ],
          ),
          SizedBox(height: 10.h,),
          Container(
            width: double.maxFinite,
            height: 40.h,
            child: Text("Dr. Jenny is very professional in her work and responsive. I have consulted and my problem is solved. 😍",
              textAlign: TextAlign.justify,
              maxLines: 2,
            ),
          ),
          SizedBox(height: 19.h,),
          Row(
            children: [
              Icon(Ionicons.heart,color: AppColor.mainColor,),
              SizedBox(width: 10.w,),
              Text("10"),
              SizedBox(width: 20.w,),
              Text("6 day ago"),
            ],
          )
        ],
      ),
    );
  }
}
