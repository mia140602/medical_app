import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/reusable_text.dart';

class TitleSection extends StatelessWidget {
  final List<String> imagePaths;
  final String? text;
   TitleSection({super.key, this.text, this.imagePaths = const []});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                 Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp)),
              SizedBox(width: 10),
              ReusableText(
                text: text ?? '',
                style: appstyle(24.sp, AppColor.textColor1, FontWeight.w600),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var imagePath in imagePaths.reversed)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    "assets/icons/$imagePath",
                    width: 28,
                    height: 28,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}