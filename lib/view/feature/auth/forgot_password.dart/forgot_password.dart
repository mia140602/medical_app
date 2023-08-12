import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/choose_btn.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_textfield.dart';
import 'package:medical_app/view/common/title_section.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final String Frame= 'assets/icons/FrameForgotPassword.svg';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w, bottom: 60.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleSection(text: "Forgot password",),
            SvgPicture.asset(Frame,width: 200.w,),
            Text("Select which contact details should we use to reset your password",style: appstyle(18.sp, AppColor.textColor1, FontWeight.normal),),
            ChooseBtn(imagePath: "assets/icons/mess.svg", text1: "via SMS", text2: "+1 111 ******99"),
            ChooseBtn(imagePath: "assets/icons/email.svg", text1: "via Email", text2: "and***ley@yourdomain.com"),
            // ChooseBtn(imagePath: "assets/icons/mess.svg", text1: "via SMS", text2: "+1 111 ******99", hasCheckbox: true,price: "\$20", time: "/30 minutes",),
            CustomButton(text: "Continue", width: double.maxFinite, height: 50,
                          outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                          onTap: () {
                            
                          },)
          ],
        ),
      ),
    );
  }
}