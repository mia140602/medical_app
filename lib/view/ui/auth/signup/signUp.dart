

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/view/ui/auth/signup/signup_bloc.dart';
import 'package:medical_app/constains/app_constain.dart';
import 'package:medical_app/services/auth_respository.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_textfield.dart';
import 'package:medical_app/view/common/custom_outline_btn.dart';
import 'package:medical_app/view/common/icon_btn.dart';
import 'package:medical_app/view/common/remember_me.dart';
import 'package:medical_app/view/common/reusable_text.dart';
import 'package:medical_app/view/ui/auth/form_submission_status.dart';
import 'package:medical_app/view/ui/auth/signin/signIn.dart';

import 'signup_event.dart';
import 'signup_state.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => SignupBloc(
          authRepo: context.read<AuthRepository>()),
        child: BlocListener<SignupBloc,SignupState>(
          listener: (context, state) {
            final formStatus= state.formStatus;
            if(formStatus is SubmissionFailed) {
              _showSnackBar(context,formStatus.exception.toString());
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
                    Text( "Creat new account", style: appstyle(32, AppColor.textColor1, FontWeight.w700),textAlign: TextAlign.center,),
                    SizedBox(height: 20.25.h,),
                    BlocBuilder<SignupBloc,SignupState>(builder: (context, state) {
                      return  CustomTextField(controller: email , 
                    hintText: "Email", 
                    keyboardType: TextInputType.emailAddress,
                    validator: (value)=> state.isvalidEmail? null:"Email Should constain @",
                      onChange: (value)=> context.read<SignupBloc>().add(
                        SignUpUseremailChanged(useremail: value)
                      ),
          
                      );
                    },),
                     SizedBox(height: 10.h,),
                     BlocBuilder<SignupBloc,SignupState>(builder: (context,state){
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
                      validator: (value)=> state.passwordValidator()?null: "Mật khẩu phải chứa ít nhất 1 chữ cái hoa, 1 chữ cái thường và 1 ký tự đặc biệt",
                      onChange: (value)=> context.read<SignupBloc>().add(
                        SignUpUserpasswordChanged(userpassword: value)
                      ),
                    );            
                     }),    
                    RememberMe(),
                     BlocBuilder<SignupBloc,SignupState>(
                      builder: (context, state) {
                        return state.formStatus is FormSubmitting
                        ?Center(child: CircularProgressIndicator(color: AppColor.mainColor,))
                        :CustomButton(text: "Sign up", width: 300, height: 50,
                          outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                          onTap: () {
                            if(_formkey.currentState?.validate()??false){
                              context.read<SignupBloc>().add(SignUpSubmitted());
                            }
                          },);
                      }),
                     SizedBox(height: 20.h,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
              
                      children: [
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
                        ReusableText(text: "Already have an account? ", style: appstyle(14, Colors.grey, FontWeight.normal)),
                        GestureDetector(
                          onTap: () {
                             Navigator.of(context)
                            .push(MaterialPageRoute(
                              builder:(context)=> SignIn()));
                          },
                          child: ReusableText(text: "Sign In",style: appstyle(14, AppColor.mainColor, FontWeight.normal),))
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