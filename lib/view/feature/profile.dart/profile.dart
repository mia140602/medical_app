import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/title_section.dart';
import 'package:medical_app/view/feature/onboarding/onboarding_screen.dart';
import 'package:medical_app/view/feature/profile.dart/bloc/profile_bloc.dart';
import 'package:medical_app/view/feature/profile.dart/bloc/profile_event.dart';
import 'package:medical_app/view/feature/profile.dart/bloc/profile_state.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState(){
    super.initState();
    context.read<ProfileBloc>().add(ProfileGetUserInfo());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc,ProfileState>(
      builder: (context,state){
        String name='Loading...';
        if (state is UserInfoLoaded){
          name=state.userInfo.name??"Không thể hiển thị";
        }
        return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 24.h, left: 20.w, right: 20.w, bottom: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleSection(text: "Hồ sơ", imagePaths: ["more.svg"],),
              SizedBox(height: 209.h,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 6.w),
                      width: 140.w,
                      height: 140.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(image: AssetImage("assets/img/avt1.png"))
                      ),
                      child: Image(
                        width: 35.w,
                        height: 35.h,
                        image: const AssetImage("assets/img/edit_3.png"),
                        // color: AppColor.mainColor,
                      )),
                    Text(name,style: appstyle(24.sp, AppColor.textColor1, FontWeight.bold), ),
                    Text("+8497786680",style: appstyle(14.sp, AppColor.textColor1, FontWeight.normal), ),
                   
                  ],
                ),
              ),
              SizedBox(height: 24.h,),
               GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/fillProfile"),
                child: _listProfile("Chỉnh sửa hồ sơ", Ionicons.person_outline)),
               _listProfile("Thông báo", Ionicons.notifications_outline),
               _listProfile("Thanh toán", Icons.payment_rounded),
               _listProfile("Bảo mật", Icons.security),
               _listProfile("Ngôn ngữ", Ionicons.language_outline),
               _listProfile("Chế độ tối", Ionicons.eye_outline),
               _listProfile("Trung tâm hỗ trợ", Ionicons.help_circle_outline),
               _listProfile("Mời bạn bè", Ionicons.person_add_outline),
               
               SizedBox(height: 10.h,),
               GestureDetector(
                onTap: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => OnBoardingScreen()), (route) => false),
                 child: Row(
                  children: [
                    Icon(Ionicons.exit_outline,color: Colors.red,),
                    SizedBox(width: 15.w,),
                    Expanded(child: Text("Đăng xuất",style: appstyle(18.sp, Colors.red, FontWeight.normal),)),
                    
                  ],
                 ),
               )
        
            ],
          ),
        ),
      ),
    );
      } );
  }
    Widget _listProfile(
      // int index, BuildContext context, 
    String listName, IconData icon){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      width:  double.maxFinite,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 15.w,),
          Expanded(child: Text(listName,style: appstyle(18.sp, AppColor.textColor1, FontWeight.normal),)),
          Icon(Ionicons.arrow_forward_outline)

        ],
      ),
    );
  }
}
