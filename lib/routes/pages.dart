


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/global.dart';
import 'package:medical_app/routes/routes.dart';
import 'package:medical_app/view/feature/Action_menu/favorite.dart';
import 'package:medical_app/view/feature/Action_menu/topDoctor/bloc/topDoctor_bloc.dart';
import 'package:medical_app/view/feature/Action_menu/topDoctor/top_doctor.dart';
import 'package:medical_app/view/feature/application/application_page.dart';
import 'package:medical_app/view/feature/application/bloc/app_blocs.dart';
import 'package:medical_app/view/feature/auth/forgot_password.dart/forgot_password.dart';
import 'package:medical_app/view/feature/auth/let_you_in.dart';
import 'package:medical_app/view/feature/auth/signin/bloc/signin_bloc.dart';
import 'package:medical_app/view/feature/auth/signin/signIn.dart';
import 'package:medical_app/view/feature/auth/signup/bloc/signup_bloc.dart';
import 'package:medical_app/view/feature/auth/signup/signUp.dart';
import 'package:medical_app/view/feature/booking/booking_page.dart';
import 'package:medical_app/view/feature/booking/patien_detail/patien_detail.dart';
import 'package:medical_app/view/feature/booking/payment.dart';
import 'package:medical_app/view/feature/booking/selectType.dart';
import 'package:medical_app/view/feature/doctor_appointment/doctor_detail.dart';

import 'package:medical_app/view/feature/onboarding/bloc/onb_blocs.dart';
import 'package:medical_app/view/feature/onboarding/onboarding_screen.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/bloc/fill_bloc.dart';
import 'package:medical_app/view/feature/profile.dart/fillprofile/fillProfile_controller.dart';
import 'package:medical_app/view/feature/profile.dart/profile.dart';
import 'package:medical_app/view/feature/search/search_screen.dart';


import '../view/feature/profile.dart/bloc/profile_bloc.dart';
import '../view/feature/profile.dart/fillprofile/fill_profile.dart';
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
    PageEntity(route: AppRoutes.SEARCH, 
              page: const SearchScreen(), 
              // bloc: BlocProvider(create: (_)=> AppBlocs(),)
              ),
    PageEntity(route: AppRoutes.FillPROFILE, 
              page: const FillProfile(), 
              bloc: BlocProvider(create: (_)=> FillProfileBloc(controller: FillProfileController() ),
              child: FillProfile(),)
              ),
    PageEntity(route: AppRoutes.FORGOTPASSWORD, 
              page: const ForgotPassword(), 
              // bloc: BlocProvider(create: (_)=> AppBlocs(),)
              ),
    PageEntity(route: AppRoutes.TOPDOCTOR, 
              page: const TopDoctor(), 
              bloc: BlocProvider(create: (_)=> TopDoctorBloc(),)
              ),
    PageEntity(route: AppRoutes.FAVORITE, 
              page: const Favorite(), 
              // bloc: BlocProvider(create: (_)=> AppBlocs(),)
              ),
    PageEntity(route: AppRoutes.DOCTORDETAIL, 
              page: const DoctorDetail(), 
              // bloc: BlocProvider(create: (_)=> AppBlocs(),)
              ),
    PageEntity(route: AppRoutes.BOOKINGPAGE, 
              page: const BookingPage(), 
              // bloc: BlocProvider(create: (_)=> AppBlocs(),)
              ),
    PageEntity(route: AppRoutes.PROFILE, 
              page: const ProfileScreen(), 
              bloc: BlocProvider(create: (_)=> ProfileBloc(controller: FillProfileController()),)
              ),
    PageEntity(route: AppRoutes.SECLECTPACKAGE, 
              page: const SelectType(), 
              // bloc: BlocProvider(create: (_)=> AppBlocs(),)
              ),
    PageEntity(route: AppRoutes.PATIENDETAIL, 
              page: const PatienDetail(), 
              // bloc: BlocProvider(create: (_)=> AppBlocs(),)
              ),
    PageEntity(route: AppRoutes.PAYMENT, 
              page: const Payment(), 
              // bloc: BlocProvider(create: (_)=> AppBlocs(),)
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
static MaterialPageRoute GenerateRouteSettings( RouteSettings settings, ){
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
  print("Invalid route name ${settings.name}");
  return MaterialPageRoute(builder: (_)=> ApplicationPage(),settings: settings);
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