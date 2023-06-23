
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/constains/app_constain.dart';
import 'package:medical_app/cubits/auth_cubit.dart';
import 'package:medical_app/cubits/auth_navigator.dart';
import 'package:medical_app/services/auth_respository.dart';
import 'package:medical_app/view/common/app_style.dart';
import 'package:medical_app/view/common/reusable_text.dart';
import 'package:medical_app/view/ui/auth/confirmation/confirmation.dart';
import 'package:medical_app/view/ui/auth/forgot_password.dart/forgot_password.dart';


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
           home:const ForgotPassword(),
          );
        });
  }
}

 
