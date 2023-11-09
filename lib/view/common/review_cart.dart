
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/star_rate.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String review;
  final String rate;
  const ReviewCard({super.key, required this.name, required this.review, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all( 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.kTextField,
      ),
      
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             CircleAvatar(backgroundImage: AssetImage("assets/img/emtyAvatar.png"),),
             Text(name,style: appstyle(13.sp, AppColor.textColor1, FontWeight.bold),
             
             ),
             StarRate(star: rate),
             SvgPicture.asset("assets/icons/more.svg")
            ],
          ),
          SizedBox(height: 10.h,),
          Container(
            width: double.maxFinite,
            height: 40.h,
            child: Text(review,
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
