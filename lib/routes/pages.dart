

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/global.dart';
import 'package:medical_app/routes/routes.dart';
import 'package:medical_app/view/feature/application/application_page.dart';
import 'package:medical_app/view/feature/application/bloc/app_blocs.dart';
import 'package:medical_app/view/feature/auth/let_you_in.dart';
import 'package:medical_app/view/feature/auth/signin/bloc/signin_bloc.dart';
import 'package:medical_app/view/feature/auth/signin/signIn.dart';
import 'package:medical_app/view/feature/auth/signup/bloc/signup_bloc.dart';
import 'package:medical_app/view/feature/auth/signup/signUp.dart';
import 'package:medical_app/view/feature/onboarding/bloc/onb_blocs.dart';
import 'package:medical_app/view/feature/onboarding/onboarding_screen.dart';

import 'names.dart';

class AppPages{
 static List<PageEntity> routes(){
    return [
    PageEntity(route: AppRoutes.INITIAL, 
              page: const OnBoardingScreen(), 
              bloc: BlocProvider(create: (_)=> OnbBloc(),)
              ),
    PageEntity(route: AppRoutes.LETIN, 
              page: const LetIn(), 
              // bloc: null
              ),
    PageEntity(route: AppRoutes.SIGNIN, 
              page: const SignIn(), 
              bloc: BlocProvider(create: (_)=> SigninBloc(),)
              ),
    PageEntity(route: AppRoutes.SIGNUP, 
              page: const SignUp(), 
              bloc: BlocProvider(create: (_)=> SignupBloc(),)
              ),
    PageEntity(route: AppRoutes.APPLICATION, 
              page: const ApplicationPage(), 
              bloc: BlocProvider(create: (_)=> AppBlocs(),)
              ),
  ];
  }
  static List<dynamic> allBlocProviders(BuildContext context){
  List<dynamic> blocProviders= <dynamic>[];
  for (var bloc in routes()){
        if(bloc.bloc != null){
           blocProviders.add(bloc.bloc);
        }
  }
  return blocProviders;
}
static MaterialPageRoute GenerateRouteSettings( RouteSettings settings){
  if(settings.name != null){
    //check route name matching when navigator gets triggered
      var result = routes().where((element) => element.route== settings.name);
      if(result.isNotEmpty){
       
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
       
        if(result.first.route==AppRoutes.INITIAL&& deviceFirstOpen){
         bool isLoggedin= Global.storageService.getIsLoggedIn();
         if(isLoggedin){
          return MaterialPageRoute(builder: (_)=> const ApplicationPage());
         }

         return MaterialPageRoute(builder: (_)=> SignIn(),settings: settings);
        }
        return MaterialPageRoute(builder: (context) => result.first.page,settings: settings);
        print("Valid route name: ${settings.name}");
        return MaterialPageRoute(builder: (_)=> result.first.page,settings: settings);
      }
  }
  print("Invalid route nảm ${settings.name}");
  return MaterialPageRoute(builder: (_)=> SignIn(),settings: settings);
}

}
//Thoosng nhat provider , routes va pages
class PageEntity{
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}