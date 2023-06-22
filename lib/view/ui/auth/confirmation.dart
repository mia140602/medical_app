import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/constains/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/code_field.dart';
import 'package:medical_app/view/common/reusable_text.dart';

import '../../common/custom_btn.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w, bottom: 30.h),
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              Row(
                children: [
                   Icon(Icons.arrow_back,color:Colors.black ,size: 28, ),
                   SizedBox(width: 30.w,),
                   ReusableText(text: "OTP Code Verification", style: appstyle(25.sp, Colors.black, FontWeight.w700))
                ],
              ),
              SizedBox(height: 150.h,),
              Text("Code has been send to +1 111 ******99",style: appstyle(18.sp, AppColor.textColor1, FontWeight.normal),),
              SizedBox(height: 70.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CodeField(),
                  CodeField(),
                  CodeField(),
                  CodeField(),
                ],
              ),
              SizedBox(height: 70.h,),
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
              SizedBox(height: 150.h,),
              CustomButton(text: "Verify", width: double.maxFinite, height: 50,
                            outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                            onTap: () {
                              
                            },)
            ],
          ),
        ),
      ),
    );
  }
}