import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_textfield.dart';
import 'package:medical_app/view/common/drop_down_form_field.dart';
import 'package:medical_app/view/common/title_section.dart';
import 'package:medical_app/view/feature/profile.dart/bloc/profile_state.dart';


import '../../../common/app_style.dart';
import '../../profile.dart/bloc/profile_bloc.dart';
import '../../profile.dart/bloc/profile_event.dart';

class PatienDetail extends StatefulWidget {
  const PatienDetail({super.key});

  @override
  State<PatienDetail> createState() => _PatienDetailState();
}

class _PatienDetailState extends State<PatienDetail> {

  String? genderValue;
  final TextEditingController name = TextEditingController();
  final TextEditingController nickName = TextEditingController();
  final TextEditingController dateBirthday = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController gender= TextEditingController();

  @override
  void initState(){
    super.initState();
    context.read<ProfileBloc>().add(ProfileGetUserInfo());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc,ProfileState>(
      builder: (context,state){
        String namehinttext =" Điền tên của bạn";
        String genderHintText =" Điền tên của bạn";
        if (state is UserInfoLoaded){
          namehinttext= state.userInfo.name??"Điền tên đầy đủ của bạn";
          genderHintText=state.userInfo.gender??"Khác";
        }
        return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(
                top: 40.h, left: 20.w, right: 20.w, bottom: 40.h),
            child: Column(
              children: [
              TitleSection(
                text: "Patient Detail",
              ),
              SizedBox(
                    height: 30.h,
                  ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Full Name",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                      controller: name,
                      hintText: namehinttext,
                      keyboardType: TextInputType.name),
                  
                  SizedBox(
                    height: 24.h,
                  ),
                  Text("Gender",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
                  SizedBox(
                    height: 24.h,
                  ),
                   Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.transparent, width: 1),
                    color: AppColor.kTextField,
                  
                  ),
                    child: DropdownButtonFormField<String>(
                      value: genderValue,
                      hint: Text(genderHintText),
                      onChanged: (String? newValue) {
                        setState(() {
                          genderValue = newValue;
                        });
                        },
                        items: <String>['Nam', 'Nữ', 'Khác']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                  ),
                  
                  SizedBox(
                    height: 24.h,
                  ),
                  Text("Your Age",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                      controller: nickName,
                      hintText: "nickNameHintText",
                      keyboardType: TextInputType.number),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text("Write your problem",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    // height: 100.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColor.kTextField,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red,width: 0.5)
                        ) ,
                        focusedBorder:  OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(20),
                          borderSide: BorderSide(color: AppColor.mainColor,width: 2),
                          
                          ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red,width: 0.5)
                    ),
                        disabledBorder:  OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(20),
                          borderSide: BorderSide(color: AppColor.secondColor,width: 0.5)
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.transparent,width: 0.5),
                        ),
                        // border: InputBorder.none,
                      ),
                      controller: email,
                      cursorHeight: 25,
                      style: appstyle(14, Colors.black, FontWeight.w500),
                      // validator: validator,
                      // onChanged: onChange,
                      

                      )
                  ),
                  
                  
                 
                ],
              )),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/payment"),
                child: CustomButton(
                  text: "Continue",
                  width: 380,
                  outlineBtnColor: AppColor.mainColor,
                  
                  textColor: Colors.white,
                  color: AppColor.mainColor,
                  height: 50,
                ),
              )
            ])),
      ),
    );
      }
      );
      }
  }

