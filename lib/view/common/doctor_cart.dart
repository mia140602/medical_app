import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';

import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';

class DoctorCart extends StatelessWidget {
  String imgPath;
  String doctorName;
  String category;
  String clinic;
  bool isfavotite;

  DoctorCart({super.key, required this.imgPath, required this.doctorName, required this.category,
  required this.clinic, this.isfavotite=false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
     
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          shape:  RoundedRectangleBorder(
            side: BorderSide(
              color: AppColor.kTextField
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 110.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage(imgPath))
                      ),
                    ),
                    SizedBox(width:10.w ,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(doctorName,style: appstyle(18.sp, AppColor.textColor1, FontWeight.bold),),
                              SvgPicture.asset(
                                isfavotite?"assets/icons/heartFill.svg"
                                :"assets/icons/heart.svg", color: AppColor.mainColor,width: 20,)
                            ],
                          ),
                          
                           Container(
                             margin: EdgeInsets.symmetric(vertical: 10), // Khoảng cách trên và dưới đường kẻ ngang

                             child: Container(
                              height: 2, // Chiều cao của đường kẻ ngang
                              color: AppColor.kBorder, // Màu nền mờ của đường kẻ ngang
                                                     ),
                           ),
                          
                          Text(category+" | " + clinic),
                          SizedBox(height: 16.h,),

                          Row(children: [
                            Icon(
                              
                              Ionicons.star_half_sharp,color: AppColor.mainColor,),
                            Text("4.3"+"(5000 reviews)"),
                          ],)
                        ],
                      ),
                    )
                
              ],
            ),
          ),
        ),
      ),
    );

  }
}