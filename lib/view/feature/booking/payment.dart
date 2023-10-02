import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/app_constant.dart';
import '../../common/app_style.dart';
import '../../common/title_section.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
                top: 40.h, left: 20.w, right: 20.w, bottom: 40.h),
        child: Column(
          children: [
            TitleSection(
                text: "Payment", imagePaths: ["scan.svg"],
              ),
            SizedBox(height: 24.h,),
            Text("Chọn phương thức thanh toán bạn muốn sử dụng'",style: appstyle(18.sp, AppColor.secondColor, FontWeight.normal),),
            SizedBox(height: 24.h,),
            Container(
              decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24))
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/zalopay.svg")
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}