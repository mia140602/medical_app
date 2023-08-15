

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/view/feature/auth/signin/signin_bloc.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/feature/auth/signin/signin_event.dart';
import 'package:medical_app/services/auth_respository.dart';
import 'package:medical_app/view/feature/auth/signin/signin_state.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_textfield.dart';
import 'package:medical_app/view/common/icon_btn.dart';
import 'package:medical_app/view/common/remember_me.dart';
import 'package:medical_app/view/common/reusable_text.dart';
import 'package:medical_app/view/feature/auth/form_submission_status.dart';
import 'package:medical_app/view/feature/auth/signup/signUp.dart';

class SignIn extends StatefulWidget {
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context)=> SigninBloc(
          authRepo: context.read<AuthRepository>()),
        child: BlocListener<SigninBloc,SigninState>(
          listener: (context,state){
            final formStatus= state.formStatus;
            if(formStatus is SubmissionFailed){
              _showSnackBar(context, formStatus.exception.toString());
            }
          },
          child: Form(
            key: _formkey,
            child: Container(
              
              margin: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w, bottom: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back,color:Colors.black ,size: 28,),
                      ],
                    ),
                    SizedBox(height: 20.25.h,),
                    SvgPicture.asset(logo,width: 120.w,color: AppColor.mainColor,),
                    SizedBox(height: 20.25.h,),
                    Text( "Login To Your Account", style: appstyle(30, AppColor.textColor1, FontWeight.w700),textAlign: TextAlign.center,),
                    SizedBox(height: 20.25.h,),
                    BlocBuilder<SigninBloc,SigninState>(builder: (context, state) {
                      return  CustomTextField(controller: email , 
                    hintText: "Email", 
                    keyboardType: TextInputType.emailAddress,
                    validator: (value)=> state.isvalidEmail? null:"Email Should constain @",
                      onChange: (value)=> context.read<SigninBloc>().add(
                        SignInUseremailChanged(useremail: value)
                      ),
          
                      );
                    },),
                     SizedBox(height: 10.h,),
                     BlocBuilder<SigninBloc,SigninState>(builder: (context,state){
                        return CustomTextField(
                      obscureText: true,
                      controller: password ,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Password",
              
                      suffixIcon: GestureDetector(
                        onTap: (() {      
                        }),
                        child: Icon(
                          Icons.visibility_off , color: AppColor.secondColor,)
                      ),
                      validator: (value)=> state.isValidPassword?null: "Password is too short",
                      onChange: (value)=> context.read<SigninBloc>().add(
                        SignInUserpasswordChanged(userpassword: value)
                      ),
                    );            
                     }),
                    RememberMe(),
                    BlocBuilder<SigninBloc,SigninState>(
                      builder: (context, state) {
                        return state.formStatus is FormSubmitting
                        ?Center(child: CircularProgressIndicator(color: AppColor.mainColor,))
                        :CustomButton(text: "Sign in", width: 300, height: 50,
                          outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                         );
                      }),
                     SizedBox(height: 20.h,),
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableText(text: "Forgot the password?", style: appstyle(14, AppColor.mainColor, FontWeight.normal)),
                        SizedBox(height: 20.h,),
                        ReusableText(text: "-Or continue with- ", style: appstyle(14, Colors.grey, FontWeight.normal)),
                       
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
                        ReusableText(text: "Don't have account? ", style: appstyle(14, Colors.grey, FontWeight.normal)),
                        GestureDetector(
                          onTap: () {
                            //sử lý chuyển trang đơn giản ko yêu cầu quản lý trạng thái phức tạp
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
            ),
          ),
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String message){
  final snackBar= SnackBar(content: Text(message,));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}