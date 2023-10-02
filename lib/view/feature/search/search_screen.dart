import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_app/config/app_constant.dart';

class SearchScreen extends StatelessWidget {
static const String routeName='/search';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_)=> SearchScreen());
  }

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
                top: 40.h, left: 20.w, right: 20.w, bottom: 10.h),
        child: Column(
          children: [
           Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back)),
              SizedBox(width: 10,),
              Expanded(
                child:  Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.transparent, width: 1),
                    color: AppColor.kTextField
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      suffixIcon: Icon(Icons.sort)
                    ),
                  ),
                )
                )
            ],
           )
          ],
        ),
      ),
    );
  }
}