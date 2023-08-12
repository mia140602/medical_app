import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medical_app/config/app_constain.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/reusable_text.dart';
import 'package:medical_app/view/feature/onboarding/onboarding_screen.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (context) => const SplashScreen2())
      );
    } );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/img/logo.png"),width: 60,),
                SizedBox(width: 20,),
                ReusableText(text: "Medica", style: appstyle(50, AppColor.textColor1, FontWeight.w500))
              ],
            ),
            // SizedBox(height: 200,),
            Positioned(
              bottom: 50,
              child: SpinKitCircle(
                color: AppColor.mainColor,
                
              ),
            )
          ],
        ),
      ),
    );
  }
}


class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (context) => const OnBoardingScreen())
      );
    } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              width: double.maxFinite,
              height: height*0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/onb1.png"),
                  fit: BoxFit.cover
                )
              ),
            ),
            
            ReusableText(text: "Welcome to ", 
            style: appstyle(40, AppColor.mainColor, FontWeight.bold)),
            ReusableText(text: "Medica! ", 
            style: appstyle(40, AppColor.mainColor, FontWeight.bold)),
            SizedBox(height: 30,),
           

            Container(          
              width: width*0.8,
                child:Text(textOnb1, style: appstyle(18, AppColor.textColor1, FontWeight.normal),textAlign: TextAlign.center,),
              ),
            
          ],
        ),
      ),
    );
  }
}