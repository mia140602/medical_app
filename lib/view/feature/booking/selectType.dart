import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_constain.dart';
import '../../common/app_style.dart';
import '../../common/choose_btn.dart';
import '../../common/title_section.dart';

class SelectType extends StatefulWidget {
  const SelectType({super.key});

  @override
  State<SelectType> createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            // ChooseBtn(imagePath: "assets/icons/mess.svg", text1: "via SMS", text2: "+1 111 ******99",size: 50,),
            // SizedBox(height: 24.h,),
            // ChooseBtn(imagePath: "assets/icons/mess.svg", text1: "via SMS", text2: "+1 111 ******99",size: 50,),
          ],
        ),
      ),
    );
  }
}
