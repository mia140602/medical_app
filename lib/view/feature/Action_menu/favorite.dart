import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/view/common/doctor_cart.dart';
import 'package:medical_app/view/common/title_section.dart';

class Favorite extends StatefulWidget {

  static const String routeName='/favorite';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_)=> Favorite());
  }
  
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w, bottom: 60.h),
        child: Column(
          children: [
            TitleSection(text: "My Favorite Doctor", imagePaths: ["Search.svg","more.svg"],),
            SizedBox(height: 20.h,),
            DoctorCart()
          ],
        ),
      ),
    );
  }
}