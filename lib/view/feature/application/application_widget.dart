import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_app/view/feature/appointment/appointment_screen.dart';
import 'package:medical_app/view/feature/appointment/bloc/appointment_bloc.dart';
import 'package:medical_app/view/feature/appointment/history.dart';
import 'package:medical_app/view/feature/home/home_screen.dart';

import 'package:medical_app/view/feature/profile.dart/bloc/profile_bloc.dart';
import 'package:medical_app/view/feature/profile.dart/profile.dart';

import '../home/bloc/home_bloc.dart';
import '../profile.dart/fillprofile/fillProfile_controller.dart';

Widget buildPage(int index){
  
  List<Widget> _widget=[
    BlocProvider(
      create: (context) => HomeBloc(controller: FillProfileController()),
      child: HomeScreen(),
    ),
    BlocProvider(
      create: (context) => AppointmentBloc(),
      child: AppointmentScreen(),
    ),
    
    //  ChatPage(),
    
    BlocProvider(
      create: (context) => AppointmentBloc(),
      child: HistoryScreen(),
    ),
    
    
    Center(child: Text("Chức năng chưa được triển khai"),),
    
    BlocProvider(
      create: (context) => ProfileBloc(controller: FillProfileController()),
      child: ProfileScreen(),
    ),
    
  ];
  return _widget[index];
}
var bottomTabs=[
 const BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Trang chủ",
            ),
  const          BottomNavigationBarItem(
            icon: Icon(Ionicons.calendar_outline),
            label: "Lịch hẹn",
            ),
  const          BottomNavigationBarItem(
            icon: Icon(Ionicons.reader_outline),
            label: "Lịch sử",
            ),
   const         BottomNavigationBarItem(
            icon: Icon(Ionicons.document_text_outline),
            label: "Bài báo",
            ),
            
   const         BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Hồ sơ",
            ),

];