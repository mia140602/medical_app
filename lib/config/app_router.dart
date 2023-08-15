
import 'package:flutter/material.dart';
import 'package:medical_app/view/feature/Action_menu/favorite.dart';
import 'package:medical_app/view/feature/Action_menu/top_doctor.dart';
import 'package:medical_app/view/feature/home/home_screen.dart';
import 'package:medical_app/view/feature/Action_menu/notification.dart';
import 'package:medical_app/view/feature/search/search_screen.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    print("This is route: ${settings.name}");
    switch (settings.name){
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case AppNotification.routeName:
        return AppNotification.route();
      case Favorite.routeName:
        return Favorite.route();
      case TopDoctor.routeName:
        return TopDoctor.route();
      case SearchScreen.routeName:
        return SearchScreen.route();

      default:
        return _errorRoute();
    }

  }
  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_)=> Scaffold(
        appBar: AppBar(title: Text("Error")),
      ));
  }

}