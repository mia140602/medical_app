import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/avt.dart';
import 'package:medical_app/view/common/doctor_speciality.dart';
import 'package:medical_app/view/common/reusable_text.dart';
import 'package:medical_app/view/feature/Action_menu/favorite.dart';
import 'package:medical_app/view/feature/Action_menu/notification.dart';

import '../../common/custom_btn.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_)=> HomeScreen());
  }
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

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
                top: 40.h, left: 20.w, right: 20.w, bottom: 10.h),
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/notification');
                  },
                  child: Icon(Ionicons.notifications_outline, color: AppColor.textColor1,size: 28,)),
                SizedBox(width: 10.w,),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/favorite');
                  },
                  child: Icon(Ionicons.heart_outline, color: AppColor.textColor1,size: 28,)),
               
              ],
            ),
            
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.transparent, width: 1),
                color: AppColor.kTextField,
       
      ),
              child:GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  height: 50.h,
                  decoration: BoxDecoration(
              
                    color: AppColor.kTextField
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/Search.svg",width: 20,),
                      SizedBox(width: 20,),
                      Text("Search"),
                    ],
                  ),
                ),
              )
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
                              ),
                            
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/topDoctor');
                  },
                  child: Text( "See all", style: appstyle(16, AppColor.mainColor, FontWeight.w700))),
              ],
            ),
            const DoctorSpeciality(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(text: "Top Doctor", style: appstyle(20, AppColor.textColor1, FontWeight.w700)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/topDoctor');
                  },
                  child: Text( "See all", style: appstyle(16, AppColor.mainColor, FontWeight.w700))),
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
        onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed('/');
        break;
      case 1:
      Navigator.of(context).pushNamed(AppNotification.routeName);
        break;
      case 2:
        Navigator.of(context).pushNamed(Favorite.routeName);
        break;
      case 3:
        Navigator.of(context).pushNamed('/');
        break;
      case 4:
        Navigator.of(context).pushNamed('/');
        break;
    }
      },

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