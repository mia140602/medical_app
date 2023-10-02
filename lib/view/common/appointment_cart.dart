import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/view/feature/appointment/appointment_screen.dart';

import '../../config/app_constant.dart';
import 'app_style.dart';
import 'custom_btn.dart';

class AppointmentCart extends StatelessWidget {
  String imgPath;
  String doctorName;
  String category;
  FilterStatus status;
  FilterType type;
  String textBtn1;
  String textBtn2;
 AppointmentCart({super.key, required this.doctorName, 
      required this.imgPath, required this.category, 
      required this.status, required this.type,
      required this.textBtn1, required this.textBtn2
      });

  @override
  Widget build(BuildContext context) {
    return Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(image: AssetImage(imgPath))
                    ),
                  ),
                  SizedBox(width:10.w ,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          style: appstyle(18, AppColor.textColor1, FontWeight.bold),

                        ),
                        Row(
                          children: [
                            Text(
                              type.displayName,
                              style: appstyle(12.sp, AppColor.textColor1, FontWeight.normal),
                            ),
                            Text(" - "),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: AppColor.mainColor)
                              ),
                              child: Text(
                                status.displayName,
                                style: appstyle(12.sp, AppColor.mainColor, FontWeight.normal),
                              ),
                            ),
                            
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  SvgPicture.asset(type.imgPath,color: AppColor.mainColor,width: 56.w,)
                  // SvgPicture.asset("assets/icons/mess.svg",color: AppColor.mainColor,width: 56.w,)
                ],
              ),
              Container(
              margin: EdgeInsets.symmetric(vertical: 10), // Khoảng cách trên và dưới đường kẻ ngang
              child: Container(
                height: 1, // Chiều cao của đường kẻ ngang
                color: Colors.grey.withOpacity(0.5), // Màu nền mờ của đường kẻ ngang
              ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  CustomButton(
                    text: textBtn1, 
                    width: 140.w, 
                    // wrapContentWidth: true,
                    height: 30.h,
                    outlineBtnColor: AppColor.mainColor,
                    textColor: AppColor.mainColor,
                    textSize: 14.sp,
                    ),
                     CustomButton(
                    text: textBtn2, 
                    width: 140.w, 
                    // wrapContentWidth: true,
                    height: 30.h,
                    outlineBtnColor: AppColor.mainColor,
                    textColor: Colors.white,
                    color: AppColor.mainColor,
                    textSize: 14.sp,
                    ),

                ],
              )
            ],
          );
  }
}