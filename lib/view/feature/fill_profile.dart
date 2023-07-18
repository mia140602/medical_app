import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constains/app_constain.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/custom_textfield.dart';
import 'package:medical_app/view/common/drop_down_form_field.dart';
import 'package:medical_app/view/common/title_section.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  final TextEditingController name = TextEditingController();
  final TextEditingController nickName = TextEditingController();
  final TextEditingController dateBirthday = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(
                top: 40.h, left: 20.w, right: 20.w, bottom: 60.h),
            child: Column(children: [
              TitleSection(
                text: "Fill Your Profile",
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            Image.asset("assets/img/profile/emptyProfile.png")),
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
                      hintText: "Full Name",
                      keyboardType: TextInputType.name),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                      controller: nickName,
                      hintText: "Nickname",
                      keyboardType: TextInputType.name),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    controller: dateBirthday,
                    hintText: "Date of Birth",
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
                    controller: email,
                    hintText: "Email",
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
                  CustomTextField(
                      controller: email,
                      hintText: "Gender",
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: DropDownField(
                        productSizeList: ["Male", "Female", "Others"],
                      )),
                ],
              )),
              SizedBox(
                height: 24.h,
              ),
              CustomButton(
                text: "Continue",
                width: 380,
                outlineBtnColor: AppColor.mainColor,
                onTap: () {},
                textColor: Colors.white,
                color: AppColor.mainColor,
                height: 50,
              )
            ])),
      ),
    );
  }
}
