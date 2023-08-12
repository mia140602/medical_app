import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/code_field.dart';
import 'package:medical_app/view/common/reusable_text.dart';
import 'package:medical_app/view/common/title_section.dart';

import '../../../common/custom_btn.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w, bottom: 60.h),
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleSection(text: "OTP Code Verification"),
            Column(
              children: [
                Text("Code has been send to +1 111 ******99",style: appstyle(18.sp, AppColor.textColor1, FontWeight.normal),),
                SizedBox(height: 50.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CodeField(),
                    CodeField(),
                    CodeField(),
                    CodeField(),
                  ],
                ),
                SizedBox(height: 50.h,),
                Text.rich(
                  TextSpan(
                    text: "Resend code in ",
                    style: appstyle(18.sp, AppColor.textColor1, FontWeight.normal),
                  children: [
                    TextSpan(
                    text: "53",
                    style: appstyle(18.sp, AppColor.mainColor, FontWeight.normal),),
                    TextSpan(
                    text: " s",
                    style: appstyle(18.sp, AppColor.textColor1, FontWeight.normal),),
                  ]
                  ),
                  
                ),
              ],
            ),
            
            
            CustomButton(text: "Verify", width: double.maxFinite, height: 50,
                          outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                          onTap: () {
                            
                          },)
          ],
        ),
      ),
    );
  }
}