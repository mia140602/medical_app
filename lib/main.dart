
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medical_app/view/feature/home/home_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
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
            // home: RepositoryProvider(
            //   create: (context) => AuthRepository(),
            //   child: BlocProvider(
            //     create: (context)=> AuthCubit(),
            //     child:  const AuthNavigator(),
            //     ),
            // ),
           home:const HomeScreen(),
          );
        });
  }
}

 
