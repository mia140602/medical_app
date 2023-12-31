import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/bloc/booking/booking_event.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_textfield.dart';
import 'package:medical_app/view/common/title_section.dart';
import 'package:medical_app/view/feature/profile.dart/bloc/profile_state.dart';


import '../../../../bloc/booking/booking_bloc.dart';
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
  final TextEditingController age= TextEditingController();

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
        String genderHintText =" Giới tính";
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
                text: "Thông tin bệnh nhân",
              ),
              SizedBox(
                    height: 30.h,
                  ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tên đầy đủ",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
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
                  Text("Giới tính",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
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
                  Text("Tuổi của bạn",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                      controller: age,
                      hintText: "Tuổi",
                      keyboardType: TextInputType.number),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text("Mô tả vấn đề bạn đang gặp",style: appstyle(18.sp, AppColor.textColor1, FontWeight.w700),),
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
                       onFieldSubmitted: (String problem) {
                        context.read<BookingBloc>().add(PatientProblemEvent(problem));
                        },
                        onChanged: (String problem) {
                          context.read<BookingBloc>().add(PatientProblemEvent(problem));
                            },
                                            
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
                  text: "Tiếp tục",
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

