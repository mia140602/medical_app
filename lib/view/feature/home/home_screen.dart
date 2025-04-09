import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/model/department_model.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/avt.dart';
import 'package:medical_app/view/common/doctor_speciality.dart';
import 'package:medical_app/view/common/reusable_text.dart';

import 'package:medical_app/view/feature/home/bloc/home_bloc.dart';
import 'package:medical_app/view/feature/home/bloc/home_event.dart';
import 'package:medical_app/view/feature/home/bloc/home_state.dart';


import '../../../services/department_service.dart';
import '../../common/custom_btn.dart';

class HomeScreen extends StatefulWidget {
  

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
void initState() {
  super.initState();
  context.read<HomeBloc>().add(HomeGetUserInfo());
}

  int _currentIndex = 0;


    
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
      builder: (context,state){
         String nickName='Loading...';
        if(state is UserInfoLoaded ){
          nickName= state.userInfo.nickName??"Test";
        }
        return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        margin: EdgeInsets.only(
                top: 10.h, left: 20.w, right: 20.w, bottom: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              
              children: [
               
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/profile"),
                  child: Avatar(size: 48, img: "emtyAvatar.png")), 
                SizedBox(width: 10.w,),
                SizedBox(
                  height: 60.h,
                  width: 200.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( "Xin chào", style: appstyle(16.sp, AppColor.secondColor, FontWeight.normal)),
                      Text(nickName, style: appstyle(20.sp, AppColor.textColor1, FontWeight.bold)),
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
                      Text("Tìm kiếm"),
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
                            ReusableText(text: "Kiểm tra sức khỏe!", style: appstyle(24, Colors.white, FontWeight.bold)),
                            Text("Hãy kiểm tra tình trạng sức khỏe của mình thường xuyên để giảm thiểu tỷ lệ mắc bệnh trong tương lai.",style: appstyle(12, Colors.white, FontWeight.normal),),
                            CustomButton(text: "Kiểm tra ngay", width: 115, height: 32,
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
                ReusableText(text: "Chuyên khoa", style: appstyle(20, AppColor.textColor1, FontWeight.w700)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/topDoctor');
                  },
                  child: Text( "Xem tất cả", style: appstyle(16, AppColor.mainColor, FontWeight.w700))),
              ],
            ),
            const DoctorSpeciality(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(text: "Bác sĩ", style: appstyle(20, AppColor.textColor1, FontWeight.w700)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/topDoctor');
                  },
                  child: Text( "Xem tất cả", style: appstyle(16, AppColor.mainColor, FontWeight.w700))),
              ],
            ),
            SizedBox(
              height: 50.h,
              width: double.maxFinite,
              child: FutureBuilder<List<DepartmentModel>>(
                future: fetchDepartments(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/topDoctor'),
                          child: CustomButton(
                            text: snapshot.data![index].departmentName,
                            width: 100,
                            wrapContentWidth: true,
                            height: 50.h,
                            outlineBtnColor: AppColor.mainColor,
                            textColor: AppColor.mainColor,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            
            
          ],
        ),
      ) ,
      
    
    );
      });
  }
}