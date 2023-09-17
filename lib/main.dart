

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/global.dart';
import 'package:medical_app/routes/routes.dart';
import 'package:medical_app/theme/dark_theme.dart';
import 'package:medical_app/theme/light_theme.dart';
Future <void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(

  // );
  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      
      // providers: AppBlocProvider.allBlocProviders,
      providers: [...AppPages.allBlocProviders( context),],
      child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Thao JobApp',
              theme: lightTheme,
              darkTheme: darkTheme,

               onGenerateRoute: AppPages.GenerateRouteSettings,
              //   initialRoute: "/"
            // home: ApplicationPage(),
            
            );
          }),
    );
  }
}

 
