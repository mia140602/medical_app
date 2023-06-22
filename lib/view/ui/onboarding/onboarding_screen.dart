import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medical_app/constains/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/reusable_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List img= [
    "onb2.png","onb3.png","onb4.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(child: Column(
      
      children: [
        Expanded(
          
        child:PageView.builder(
          
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
                    height: height*0.5,
                    decoration: BoxDecoration(
                      borderRadius:const BorderRadius.only(
                        topLeft: Radius.circular(50), 
                        topRight: Radius.circular(50)),
                        color: Colors.white,
                        
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.05,),
                        Container(
                          width: width*0.8,
                          child: Text(textOnboard[index],style: appstyle(25, AppColor.mainColor, FontWeight.w700),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  
                  
                  ),
                )
              ],
            ),
          )
          ) )],
     )),
    );
  }
}