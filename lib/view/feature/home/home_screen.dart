import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_app/constains/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/avt.dart';
import 'package:medical_app/view/common/custom_outline_btn.dart';
import 'package:medical_app/view/common/custom_textfield.dart';
import 'package:medical_app/view/common/doctor_speciality.dart';
import 'package:medical_app/view/common/reusable_text.dart';

import '../../common/custom_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DoctorIcon> doctorIcon= [
      DoctorIcon(icon: "more", name: "All"),
      DoctorIcon(icon: "general.svg", name: "General"),
      DoctorIcon(icon: "dentis.svg", name: "Dentis"),
      DoctorIcon(icon: "ophthal.svg", name: "Ophthal.."),
      DoctorIcon(icon: "nutrition.svg", name: "Nutrition"),
      DoctorIcon(icon: "neurolo.svg", name: "Neurolo.."),
      DoctorIcon(icon: "pediatric.svg", name: "Pediatric"),
      DoctorIcon(icon: "radiolo.svg", name: "Radiolo.."),
      DoctorIcon(icon: "more.svg", name: "More"),
    ];
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        margin: EdgeInsets.only(
                top: 40.h, left: 20.w, right: 20.w, bottom: 60.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              
              children: [
               
                Avatar(size: 48, img: "avt1.png"), 
                SizedBox(width: 10.w,),
                SizedBox(
                  height: 60.h,
                  width: 200.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( "Good Morning", style: appstyle(16.sp, AppColor.secondColor, FontWeight.normal)),
                      Text( "Doan Thao", style: appstyle(20.sp, AppColor.textColor1, FontWeight.bold)),
                    ],
                  ),
                ),
                Icon(Ionicons.notifications_outline, color: AppColor.textColor1,size: 28,),
                SizedBox(width: 10.w,),
                Icon(Ionicons.heart_outline, color: AppColor.textColor1,size: 28,),
               
              ],
            ),
            
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.transparent, width: 1),
                color: AppColor.kTextField,
       
      ),
              child: TextField(
                
                decoration: InputDecoration(
                  icon: Icon(Ionicons.search_outline,size: 20,),
                  hintText: "Search",
                  
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),

                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                   ),
                ),
                
                
              ),
            ),
            Container(
               
                height: 181.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppColor.mainColor
                ),
                child:  Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 24,
                      bottom: 10,
                      child: Container(
                        width: 214.w,
                        height: 181.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReusableText(text: "Medical Checks!", style: appstyle(24, Colors.white, FontWeight.bold)),
                            Text("Check your health condition regularly to minimize the incidence of disease in the future.",style: appstyle(12, Colors.white, FontWeight.normal),),
                            CustomButton(text: "Check Now", width: 115, height: 32,
                              outlineBtnColor: Colors.white, textColor: AppColor.mainColor,color: Colors.white,
                              onTap: () {
                                
                              },),
                            
                          ],
                        ),
                      )
                      ),
                      Positioned(
                              top: 15,
                              right: 0,
                              child: Image.asset("assets/img/onb2.png",width: 150,),
                            )
                  ],
                ),
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(text: "Doctor Speciality", style: appstyle(20, AppColor.textColor1, FontWeight.w700)),
                ReusableText(text: "See all", style: appstyle(16, AppColor.mainColor, FontWeight.w700)),
              ],
            ),
            const DoctorSpeciality(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(text: "Top Doctor", style: appstyle(20, AppColor.textColor1, FontWeight.w700)),
                ReusableText(text: "See all", style: appstyle(16, AppColor.mainColor, FontWeight.w700)),
              ],
            ),
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
            )
            
          ],
        ),
      ) ,
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        selectedItemColor: AppColor.mainColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
            ),
            BottomNavigationBarItem(
            icon: Icon(Ionicons.calendar_outline),
            label: "Appointm..",
            ),
            BottomNavigationBarItem(
            icon: Icon(Ionicons.reader_outline),
            label: "History",
            ),
            BottomNavigationBarItem(
            icon: Icon(Ionicons.document_text_outline),
            label: "Articles",
            ),
            
            BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Profile",
            ),
        ],
      )
    );
  }
}