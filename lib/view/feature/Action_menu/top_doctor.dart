import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/view/common/title_section.dart';

class TopDoctor extends StatefulWidget {

  static const String routeName='/topDoctor';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_)=> TopDoctor());
  }
  
  const TopDoctor({super.key});

  @override
  State<TopDoctor> createState() => _TopDoctorState();
}

class _TopDoctorState extends State<TopDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w, bottom: 60.h),
        child: Column(
          children: [
            TitleSection(text: "Top Doctor", imagePaths: ["Search.svg","more.svg"],)
          ],
        ),
      ),
    );
  }
}