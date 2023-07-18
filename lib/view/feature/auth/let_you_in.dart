import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constains/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_outline_btn.dart';
import 'package:medical_app/view/common/reusable_text.dart';
import 'package:medical_app/view/feature/auth/signin/signIn.dart';
import 'package:medical_app/view/feature/auth/signup/signUp.dart';

class LetIn extends StatefulWidget {
  const LetIn({super.key});

  @override
  State<LetIn> createState() => _LetInState();
}

class _LetInState extends State<LetIn> {
  final String Frame= 'assets/icons/Frame.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w, bottom: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back,color:Colors.black ,size: 28,),
              ],
            ),
            SizedBox(height: 20.25.h,),
            SvgPicture.asset(Frame,width: 200.w,),
            SizedBox(height: 20.25.h,),
            Text( "Let's you in", style: appstyle(48, AppColor.textColor1, FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(height: 20.25.h,),
            CustomOutlineBtn(svgImg: "fb.svg", width: 300, hieght: 50,
             color: AppColor.kBorder, text: "Continue with Facebook",textColor: AppColor.textColor1,),
             SizedBox(height: 10.h,),
             CustomOutlineBtn(svgImg: "google.svg", width: 300, hieght: 50,
             color: AppColor.kBorder, text: "Continue with Email",textColor: AppColor.textColor1,
             onTap: () {
               Navigator.of(context)
                            .push(MaterialPageRoute(
                              builder:(context)=> SignIn()));
             },),
             SizedBox(height: 10.h,),
             CustomOutlineBtn(svgImg: "apple.svg", width: 300, hieght: 50,
             color: AppColor.kBorder, text: "Continue with Apple",textColor: AppColor.textColor1,),
             SizedBox(height: 20.h,),
             CustomButton(text: "-----------------or-----------------", width: 300, outlineBtnColor: Colors.white, textColor:Colors.grey.withOpacity(0.4) ,),
             SizedBox(height: 30.h,),
             CustomButton(text: "Sign in with pasword", width: 300, height: 50,
             outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,),
             SizedBox(height: 30.h,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ReusableText(text: "Don't have account? ", style: appstyle(14, Colors.grey, FontWeight.normal)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                            .push(MaterialPageRoute(
                              builder:(context)=> SignUp()));
                  },
                  child: ReusableText(text: "Sign Up",style: appstyle(14, AppColor.mainColor, FontWeight.normal),))
              ],
             )
             
          ],
        ),
      ),
    );
  }
}