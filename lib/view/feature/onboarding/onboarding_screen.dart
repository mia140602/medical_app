import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/global.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/reusable_text.dart';
import 'package:medical_app/view/feature/onboarding/bloc/onb_blocs.dart';
import 'package:medical_app/view/feature/onboarding/bloc/onb_events.dart';
import 'bloc/onb_states.dart';

class OnBoardingScreen extends StatefulWidget {

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List img= [
    "onb2.png","onb3.png","onb4.png"
  ];
  PageController pageController= PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: BlocBuilder<OnbBloc,OnbState>(
      builder: (context, state) {
        return Container(

          child: Stack(
            alignment: Alignment.center,
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (index){
            state.page=index;
            BlocProvider.of<OnbBloc>(context).add(OnbEvent());
            
          },
          children: [
            _page(
              1,
              context,
              "Tiếp theo",
              "Bác sĩ và chuyên gia luôn hỗ trợ cho sức khỏe của bạn!",
              "onb2.png"
            ),
            _page(
              2,
              context,
              "Tiếp theo",
              "Kiểm tra & tư vấn sức khỏe dễ dàng mọi lúc mọi nơi!",
              "onb3.png"
            ),
            _page(
              3,
              context,
              "Bắt đầu",
              "Hãy bắt đầu cùng chúng tôi ngay bây giờ!",
              "onb4.png"
            ),
            
          ],
          
          
          ),
            Positioned(
                bottom: 20.h,            
              child: DotsIndicator(
              position: state.page.toInt(),
              dotsCount: 3,
              mainAxisAlignment: MainAxisAlignment.center,
              decorator: DotsDecorator(
                color: AppColor.kTextField,
                size: const Size.square(7.0),
                activeSize:const Size(20.0,8.0),
                activeColor: AppColor.mainColor,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),

              ),
            )
          ],
     ));
      },
     )
    );
  }
  Widget _page(int index, BuildContext context, String buttonName, String title, String imgPath){
    return Container(
            height: double.maxFinite,
            child: Stack(
              children: [ 
                Container(
                  height: height*0.6,
                  width: double.maxFinite,
                  decoration:const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/onbg.png")
                    )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.maxFinite,
                  height: height*0.8,
                  child: Image.asset("assets/img/"+imgPath, fit: BoxFit.fitHeight,),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: height*0.4,
                    decoration:const BoxDecoration(
                      borderRadius:BorderRadius.only(
                        topLeft: Radius.circular(50), 
                        topRight: Radius.circular(50)),
                        color: Colors.white,
                        
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.059,),

                        Container(
                          width: width*0.75,
                          child: Text(title,style: appstyle(20, AppColor.mainColor, FontWeight.w700),textAlign: TextAlign.center,),
                        ),
                        SizedBox(height: height*0.05,),
                        GestureDetector(
                          onTap: () {
                            if(index<3){
                              //animation
                              pageController.animateToPage(
                                index, 
                                duration: const Duration(milliseconds: 500), 
                                curve: Curves.decelerate);

                            }else {
                              //jump to new page
                              // Navigator.of(context).pushAndRemoveUntil(AppRoutes.LETIN, ((route) => false)); 
                              Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
                              // print("the value is ${Global.storageService.getDeviceFirstOpen()}");
                              Navigator.of(context).pushNamedAndRemoveUntil("/letin", (route) => false);
                              
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(left: 25,right: 25),
                            width: double.maxFinite,
                            height: 50.h,
                            decoration: BoxDecoration(
                              
                              color: AppColor.mainColor,
                              borderRadius: BorderRadius.all(Radius.circular(20),),
                              border: Border.all(width: 1, color: AppColor.mainColor)
                            ),
                            child: Center(
                              child: ReusableText(text: buttonName,
                              style: appstyle(16, Colors.white, FontWeight.w600),),
                            ),
                            ),
                        ),                  
                      ],
                    ),
                  
                  
                  ),
                )
              ],
            ),
          );
  }
}