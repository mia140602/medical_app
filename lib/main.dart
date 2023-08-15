
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/config/app_router.dart';

import 'package:medical_app/view/feature/home/home_screen.dart';
import 'package:medical_app/view/feature/onboarding/bloc/onb_blocs.dart';
import 'package:medical_app/view/feature/onboarding/onboarding_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => OnbBloc(),
      child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Thao JobApp',
              theme: ThemeData(
                
                
                primarySwatch: Colors.grey,
              ),
            //  onGenerateRoute: AppRouter.onGenerateRoute,
            //  initialRoute: HomeScreen.routeName,
            home: OnBoardingScreen(),
            );
          }),
    );
  }
}

 
