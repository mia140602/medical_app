import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/view/common/title_section.dart';

import '../../../config/app_constant.dart';
import '../../common/custom_btn.dart';
import '../../common/doctor_cart.dart';
import '../../common/doctor_speciality.dart';

class TopDoctor extends StatefulWidget {

  
  const TopDoctor({super.key});

  @override
  State<TopDoctor> createState() => _TopDoctorState();
}

class _TopDoctorState extends State<TopDoctor> {
    List<DoctorIcon> doctorIcon= [
      DoctorIcon(icon: "more", name: "All"),
      DoctorIcon(icon: "general.svg", name: "General"),
      DoctorIcon(icon: "dentis.svg", name: "Dentis"),
      DoctorIcon(icon: "ophthal.svg", name: "Ophthal.."),
      DoctorIcon(icon: "nutrition.svg", name: "Nutritionít"),
      DoctorIcon(icon: "neurolo.svg", name: "Neurolo.."),
      DoctorIcon(icon: "pediatric.svg", name: "Pediatric"),
      DoctorIcon(icon: "radiolo.svg", name: "Radiologycal"),
      DoctorIcon(icon: "more.svg", name: "More"),
    ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w, bottom: 60.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleSection(text: "Top Doctor", imagePaths: ["Search.svg","more.svg"],),
              SizedBox(height: 20.h,),
              SizedBox(
              
              height: 50.h,
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: doctorIcon.length,
                itemBuilder: (context,index) {
                  return CustomButton(
                    text: doctorIcon[index].name, 
                    width: 100, 
                    wrapContentWidth: true,
                    height: 50.h,
                    outlineBtnColor: AppColor.mainColor,
                    textColor: AppColor.mainColor,
                    );
                }),
            ),
            SizedBox(height: 24.h,),
                Column(
                  children:List.generate(10, (index)  {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context,'/detail' );
                    },
                    child: DoctorCart(imgPath: "assets/img/doctor1.png", doctorName: "Alex Tran", category: "dental", clinic: "Phong kham1",
                    ),
                  );
                }) ,
                )
            ],
          ),
        ),
      ),
    );
  }
}