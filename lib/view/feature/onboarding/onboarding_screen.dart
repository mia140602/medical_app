import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/reusable_text.dart';
import 'package:medical_app/view/feature/onboarding/bloc/onb_blocs.dart';
import 'package:medical_app/view/feature/onboarding/bloc/onb_events.dart';

import '../../common/custom_btn.dart';
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
        return SafeArea(child: Column(
      
      children: [
        Expanded(
          
        child:PageView.builder(
          controller: pageController,
          onPageChanged: (index){
            state.page=index;
            BlocProvider.of<OnbBloc>(context).add(OnbEvent());
            
          },
          
          itemCount: img.length,
          itemBuilder: (context, index) => 
          Container(
            height: double.maxFinite,
            child: Stack(
              children: [ 
                Container(
                  height: height*0.6,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/onbg.png")
                    )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.maxFinite,
                  height: height*0.8,
                  child: Image.asset("assets/img/"+img[index], fit: BoxFit.fitHeight,),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: height*0.4,
                    decoration: BoxDecoration(
                      borderRadius:const BorderRadius.only(
                        topLeft: Radius.circular(50), 
                        topRight: Radius.circular(50)),
                        color: Colors.white,
                        
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.059,),

                        Container(
                          width: width*0.8,
                          child: Text(textOnboard[index],style: appstyle(30, AppColor.mainColor, FontWeight.w700),textAlign: TextAlign.center,),
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

                            }else{
                              //jump to new page
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(left: 25,right: 25),
                            width: double.maxFinite,
                            height: 50,
                            decoration: BoxDecoration(
                              
                              color: AppColor.mainColor,
                              borderRadius: BorderRadius.all(Radius.circular(20),),
                              border: Border.all(width: 1, color: AppColor.mainColor)
                            ),
                            child: Center(
                              child: ReusableText(text: btnOnb[index],
                              style: appstyle(16, Colors.white, FontWeight.w600),),
                            ),
                            ),
                        ),
                        // GestureDetector(
                        //   
                        //   child: CustomButton(text: btnOnb[index], width: 300, height: 50,
                        //     outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                        //     ),
                        // ),
                          Align(
                            
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
                    ),
                  
                  
                  ),
                )
              ],
            ),
          )
          ) )],
     ));
      },
     )
    );
  }
}