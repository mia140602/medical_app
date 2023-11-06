

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_textfield.dart';
import 'package:medical_app/view/common/icon_btn.dart';
import 'package:medical_app/view/common/remember_me.dart';
import 'package:medical_app/view/common/reusable_text.dart';
import 'package:medical_app/view/feature/auth/signin/bloc/signin_bloc.dart';
import 'package:medical_app/view/feature/auth/signin/bloc/signin_event.dart';
import 'package:medical_app/view/feature/auth/signin/bloc/signin_state.dart';
import 'package:medical_app/view/feature/auth/signin/sign_in_controller.dart';

class SignIn extends StatefulWidget {
// static const String routeName='/signIn';

//   static Route route() {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (_)=> SignIn());
//   }

  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _formkey= GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final String logo= 'assets/icons/logo.svg';
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state){
        return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: 
             Form(
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
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(Icons.arrow_back,color:Colors.black ,size: 28,)),
                        ],
                      ),
                      SizedBox(height: 20.25.h,),
                      SvgPicture.asset(logo,width: 120.w,color: AppColor.mainColor,),
                      SizedBox(height: 20.25.h,),
                      Text( "Đăng nhập vài tài khoản của bạn", style: appstyle(30, AppColor.textColor1, FontWeight.w700),textAlign: TextAlign.center,),
                      SizedBox(height: 20.25.h,),
                      
                      CustomTextField(controller: email , 
                      hintText: "Email", 
                      keyboardType: TextInputType.emailAddress,
                      // validator: (value)=> state.isvalidEmail? null:"Email Should constain @",
                        onChange: (value)=> context.read<SigninBloc>().add(
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
                        // validator: (value)=> state.isValidPassword?null: "Password is too short",
                        onChange: (value)=> context.read<SigninBloc>().add(
                          PasswordEvent(value)
                        ),
                      ), 
                      
                      RememberMe(),
                      GestureDetector(
                        onTap: () {
                          SignInController(context: context).handleSignIn("email");
                          
                        },
                        child: CustomButton(text: "Đăng nhập", width: 300, height: 50,
                              outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                             ),
                      ),
                        
                       SizedBox(height: 20.h,),
                       Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed("/forgotPassword"),
                            child: ReusableText(text: "Quên mật khẩu?", style: appstyle(14, AppColor.mainColor, FontWeight.normal))),
                          SizedBox(height: 20.h,),
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
                          ReusableText(text: "Chưa có tài khoản? ", style: appstyle(14, Colors.grey, FontWeight.normal)),
                          GestureDetector(
                            onTap: () {
                              //sử lý chuyển trang đơn giản ko yêu cầu quản lý trạng thái phức tạp
                              // Navigator.of(context)
                              // .push(MaterialPageRoute(
                              //   builder:(context)=> SignUp()));
                              Navigator.of(context).pushNamed("/signup");
                            },
                            child: ReusableText(text: "Đăng ký",style: appstyle(14, AppColor.mainColor, FontWeight.normal),))
                        ],
                       )
                       
                    ],
                  ),
                ),
              ),
            ),
          ),
    );

      }
      );
    
  
  }
}

void _showSnackBar(BuildContext context, String message){
  final snackBar= SnackBar(content: Text(message,));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}