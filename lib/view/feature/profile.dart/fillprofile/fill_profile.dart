import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_textfield.dart';
import 'package:medical_app/view/common/title_section.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/bloc/fill_bloc.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/bloc/fill_event.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/bloc/fill_state.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
@override
  void initState() {
    super.initState();
    context.read<FillProfileBloc>().add(GetUserInfo());
  }
  String? genderValue;
  final TextEditingController name = TextEditingController();
  final TextEditingController nickName = TextEditingController();
  final TextEditingController dateBirthday = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController gender= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FillProfileBloc, FillProfileState>(
  listener: (context, state) {
    if (state is ProfileUpdated) {
      Navigator.pushNamed(context, "/application");
    }
  },
  builder: (context, state) {
    String emailHintText = "Email";
    String nameHintText = "Tên";
    String nickNameHintText = "Biệt danh";
    String genderHintText = "Giới tính";
    String birthdayHintText = "Ngày sinh";
    if (state is FillProfileLoaded){
      emailHintText = state.email;
    }
    
    if (state is UserInfoLoaded) {
      emailHintText = state.userInfo.email;
      nameHintText =state.userInfo.name?? "Tên";
      nickNameHintText= state.userInfo.nickName?? "Biệt Danh";
      genderHintText= state.userInfo.gender?? "Giới tính";
      birthdayHintText=state.userInfo.birthday??"Ngày sinh";
      
    }
        return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(
                top: 40.h, left: 20.w, right: 20.w, bottom: 60.h),
            child: Column(children: [
              TitleSection(
                text: "Cập nhật hồ sơ",
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            Image.asset("assets/img/avt1.png")),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        "assets/icons/edit_square.svg",
                        width: 50.w,
                        height: 50.h,
                      ))
                ],
              ),
              Form(
                  child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                      controller: name,
                      hintText: nameHintText,
                      keyboardType: TextInputType.name),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                      controller: nickName,
                      hintText: nickNameHintText,
                      keyboardType: TextInputType.name),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    controller: dateBirthday,
                    hintText: birthdayHintText,
                    keyboardType: TextInputType.datetime,
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.calendar_month),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    enable: false,
                    controller: email,
                    hintText: emailHintText,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.email_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  //DropDownField(productSizeList: ["Male", "Female", "Others"])
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
                  )
                ],
              )),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () {
                  context.read<FillProfileBloc>().add(UpdateProfile(
                      name: name.text,
                      nickName: nickName.text,
                      birthday: dateBirthday.text,
                      gender: genderValue??'', 
    ));
                },
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
      });
  }
}
