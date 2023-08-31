import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_textfield.dart';
import 'package:medical_app/view/common/remember_me.dart';
import 'package:medical_app/view/common/title_section.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final String Frame= 'assets/icons/FrameNewPassword.svg';
  final TextEditingController newpassword = TextEditingController();
  final TextEditingController typeagain = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w, bottom: 60.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
          children: [
            TitleSection(text: "Create new password",),
            SvgPicture.asset(Frame,width: 300.w,),
            Text("Create your new password",style: appstyle(18.sp, AppColor.textColor1, FontWeight.normal),),
            CustomTextField(
              controller: newpassword, 
              hintText: "Enter your new password", 
              keyboardType: TextInputType.emailAddress,
              suffixIcon: GestureDetector(
                        onTap: (() {    
                            
                        }),
                        child: Icon(
                          Icons.visibility_off , color: AppColor.secondColor,)
                      ),
                    
              ),
              CustomTextField(
              controller: typeagain, 
              hintText: "Enter your new password", 
              keyboardType: TextInputType.emailAddress,
              suffixIcon: GestureDetector(
                        onTap: (() {    
                            
                        }),
                        child: Icon(
                          Icons.visibility_off , color: AppColor.secondColor,)
                      ),
                    
              ),
              RememberMe(),
              CustomButton(text: "Continue", width: double.maxFinite, height: 50,
                          outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                          ),
          ],
        ),
      ),
    );
  }
}