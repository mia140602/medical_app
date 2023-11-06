
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/view/feature/auth/signup/bloc/signup_bloc.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_textfield.dart';
import 'package:medical_app/view/common/icon_btn.dart';
import 'package:medical_app/view/common/remember_me.dart';
import 'package:medical_app/view/common/reusable_text.dart';
import 'package:medical_app/view/feature/auth/signup/sign_up_controller.dart';

import 'bloc/signup_event.dart';
import 'bloc/signup_state.dart';

class SignUp extends StatefulWidget {


  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formkey= GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final String logo= 'assets/icons/logo.svg';
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SignupBloc,SignupState>(builder: (context,state){
        return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  Form(
              key: _formkey,
              child: Container(
                
                margin: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w, bottom: 30.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child:const Icon(Icons.arrow_back,color:Colors.black ,size: 28,)),
                        ],
                      ),
                      SizedBox(height: 20.25.h,),
                      SvgPicture.asset(logo,width: 120.w,color: AppColor.mainColor,),
                      SizedBox(height: 20.25.h,),
                      Text( "Tạo tài khoản", style: appstyle(32, AppColor.textColor1, FontWeight.w700),textAlign: TextAlign.center,),
                      SizedBox(height: 20.25.h,),
                      CustomTextField(controller: email , 
                      hintText: "Email", 
                      keyboardType: TextInputType.emailAddress,
                      // validator: (value)=> state.isvalidEmail? null:"Email Should constain @",
                        onChange: (value)=> context.read<SignupBloc>().add(
                          EmailEvent(value)
                        ),
            
                        ),
                       SizedBox(height: 20.h,),
                       CustomTextField(
                        obscureText: true,
                        controller: password ,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: "Mật khẩu",
                
                        suffixIcon: GestureDetector(
                          onTap: (() {      
                          }),
                          child: Icon(
                            Icons.visibility_off , color: AppColor.secondColor,)
                        ),
                        // validator: (value)=> state.passwordValidator()?null: "Mật khẩu phải chứa ít nhất 1 chữ cái hoa, 1 chữ cái thường và 1 ký tự đặc biệt",
                        onChange: (value)=> context.read<SignupBloc>().add(
                          PasswordEvent(value)
                        ),
                      ),   
                      RememberMe(),
                      GestureDetector(
                        onTap: () {
                          SignupController(context:context).handleEmailSignup();
                        },
                        child: CustomButton(text: "Đăng ký", width: 300, height: 50,
                              outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                              ),
                      ),
                       SizedBox(height: 20.h,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                
                        children: [
                          ReusableText(text: "-Hoặc đăng nhập bằng- ", style: appstyle(14, Colors.grey, FontWeight.normal)),
                         
                        ],
                       ),
                       SizedBox(height: 20.h,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconBtn(svgImg: "fb.svg", width: 87.w,hieght: 60.w, color: AppColor.kTextField, kBorder: AppColor.kBorder, radius: 16),
                          IconBtn(svgImg: "google.svg", width: 87.w,hieght: 60.w, color: AppColor.kTextField, kBorder: AppColor.kBorder, radius: 16),
                          IconBtn(svgImg: "apple.svg", width: 87.w,hieght: 60.w, color: AppColor.kTextField, kBorder: AppColor.kBorder, radius: 16),
                        ],
                       ),
                       SizedBox(height: 30.h,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                
                        children: [
                          ReusableText(text: "Đã có tài khoản? ", style: appstyle(14, Colors.grey, FontWeight.normal)),
                          GestureDetector(
                            onTap: () {
                              //  Navigator.of(context)
                              // .push(MaterialPageRoute(
                              //   builder:(context)=> SignIn()));
                              Navigator.of(context).pushNamed("/signin");
                            },
                            child: ReusableText(text: "Đăng nhập",style: appstyle(14, AppColor.mainColor, FontWeight.normal),))
                        ],
                       )
                       
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
    });
  }
}
void _showSnackBar(BuildContext context, String message){
  final snackBar= SnackBar(content: Text(message,));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}