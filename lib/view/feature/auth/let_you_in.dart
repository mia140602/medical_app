import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_outline_btn.dart';
import 'package:medical_app/view/common/reusable_text.dart';

class LetIn extends StatefulWidget {
static const String routeName='/letIn';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_)=> LetIn());
  }

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
            Text( "Medica", style: appstyle(40.sp, AppColor.textColor1, FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(height: 20.25.h,),
            CustomOutlineBtn(svgImg: "fb.svg", width: 300, hieght: 50,
             color: AppColor.kBorder, text: "Tiếp tục bằng Facebook",textColor: AppColor.textColor1,),
             SizedBox(height: 10.h,),
             CustomOutlineBtn(svgImg: "google.svg", width: 300, hieght: 50,
             color: AppColor.kBorder, text: "Tiếp tục bằng Email",textColor: AppColor.textColor1,
             onTap: () {
              //  Navigator.of(context)
              //               .push(MaterialPageRoute(
              //                 builder:(context)=> SignIn()));
              Navigator.of(context).pushNamed("/signin");
             },),
             SizedBox(height: 10.h,),
             CustomOutlineBtn(svgImg: "apple.svg", width: 300, hieght: 50,
             color: AppColor.kBorder, text: "Tiếp tục bằng Apple",textColor: AppColor.textColor1,),
             SizedBox(height: 20.h,),
             CustomButton(text: "-or-", width: 300, outlineBtnColor: Colors.white, textColor:Colors.grey.withOpacity(0.4) ,),
             SizedBox(height: 30.h,),
             GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/signin');
              },
               child: CustomButton(text: "Đăng nhập bằng mật khẩu", width: 300, height: 50,
               outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
               ),
             ),
             SizedBox(height: 30.h,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ReusableText(text: "Bạn chưa có tài khoản? ", style: appstyle(14, Colors.grey, FontWeight.normal)),
                GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(context, '/signup');
                  },
                  child: ReusableText(text: "Đăng ký",style: appstyle(14, AppColor.mainColor, FontWeight.normal),))
              ],
             )
             
          ],
        ),
      ),
    );
  }
}