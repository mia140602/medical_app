

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/bloc/doctor/doctor_bloc.dart';
import 'package:medical_app/bloc/doctor/doctor_state.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/custom_btn.dart';
import 'package:medical_app/view/common/doctor_cart.dart';
import 'package:medical_app/view/common/review_cart.dart';
import 'package:medical_app/view/common/title_section.dart';

import '../../../model/doctor_model.dart';

class DoctorDetail extends StatefulWidget {
  
   DoctorDetail({super.key});

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  List<Detail> detail =[
    Detail(svgPath: "assets/icons/patients.svg", number: "5000+", st: "patients"),
    Detail(svgPath: "assets/icons/experience.svg", number: "10+", st: "year-experience"),
    Detail(svgPath: "assets/icons/rating.svg", number: "4.8", st: "rating"),
    Detail(svgPath: "assets/icons/mess.svg", number: "4.942", st: "review"),
    

  ];
      

        

  @override
  Widget build(BuildContext context) {
    final state = context.read<DoctorBloc>().state;
    Doctor? doctor;
    if (state is DoctorSelectedState) {
      doctor = state.doctor;
    }

    // Kiểm tra nếu doctor không null trước khi sử dụng
    if (doctor != null) {
      return Scaffold(
            backgroundColor: Colors.white,

      body: Stack(
        children: [Container(
          padding: EdgeInsets.only(left: 20.w,top: 40.h, right: 20.w,bottom: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleSection(text: "Bác sĩ "+ doctor.userName, imagePaths: ["heart.svg","more.svg"],),
                SizedBox(height: 24.h,),
                DoctorCart(imgPath: doctor.avatar??'', doctorName: doctor.userName, category: doctor.department??"Chưa xác định", clinic: "Phong kham"),
                SizedBox(height: 16.h,),
           
                SizedBox(
                  width: double.maxFinite,
                  height: 130.h,
                  child: ListView.builder(
                  
                  itemCount: detail.length,
                  scrollDirection: Axis.horizontal,
          
                  itemBuilder: (context,index){
                    return Container(
                      width: 89.w,
                      child: Column(
                        children: [
                          SvgPicture.asset(detail[index].svgPath,color: AppColor.mainColor,width: 60.w,),
                          SizedBox(height: 10.h,),
                          Text(detail[index].number,style: appstyle(16.sp, AppColor.mainColor, FontWeight.bold),),
                          Text(detail[index].st,style: appstyle(12.sp, AppColor.textColor1, FontWeight.normal), overflow: TextOverflow.ellipsis,)
          
                        ],
                      ),
                    );
                  },
          
                  ),),
                  SizedBox(height: 24.h,),
                  Text("About Me", style: appstyle(20.sp, AppColor.textColor1, FontWeight.bold),),
                  SizedBox(height: 16.h,),
                  Container(
                    width: double.maxFinite,
                    height: 80.h,
                    child: Text(doctor.biography??
                      "Dr is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.",
                      // overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: appstyle(14.sp, AppColor.textColor1, FontWeight.normal),
                      
                    ),
                  ),
                  SizedBox(height: 24.h,),
                  Text("Working Time", style: appstyle(20.sp, AppColor.textColor1, FontWeight.bold),),
                  SizedBox(height: 16.h,),
                  Text("Monday - Friday, 08.00 AM - 20.00 PM",style: appstyle(14.sp, AppColor.textColor1, FontWeight.normal),),
          
                  SizedBox(height: 24.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Reviews", style: appstyle(20.sp, AppColor.textColor1, FontWeight.bold),),
                      Text("See all",style: appstyle(16.sp, AppColor.mainColor, FontWeight.bold,)),
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  ReviewCard(),
                  
                
                  
                  
             
          
          
              ],
            ),
          ),
        ),
         Positioned(
                      bottom: 20,
                      right: 10,
                      left: 20,
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(context, "/booking"),
                        child: CustomButton(text: "Book Appointment", width: double.maxFinite, height: 50,
                        outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                        ),
                      )
                      ),
        ]
      ),
    );
    } else {
      return Scaffold(
        // Hiển thị một widget khác nếu `doctor` là null
        // ...

      );
    }
  }
}

class Detail{
  String svgPath;
  String number;
  String st;
  Detail({ required this.svgPath, required this.number, required this.st});
} 

