import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_app/view/feature/appointment/appointment_screen.dart';
import 'package:medical_app/view/feature/home/home_screen.dart';
import 'package:medical_app/view/feature/profile.dart/profile.dart';

Widget buildPage(int index){
  List<Widget> _widget=[
    const HomeScreen(),
    AppointmentScreen(),
    Center(child: Text("History"),),
    Center(child: Text("Articles"),),
    ProfileScreen(),
    
  ];
  return _widget[index];
}
var bottomTabs=[
 const BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
            ),
  const          BottomNavigationBarItem(
            icon: Icon(Ionicons.calendar_outline),
            label: "Appointm..",
            ),
  const          BottomNavigationBarItem(
            icon: Icon(Ionicons.reader_outline),
            label: "History",
            ),
   const         BottomNavigationBarItem(
            icon: Icon(Ionicons.document_text_outline),
            label: "Articles",
            ),
            
   const         BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Profile",
            ),

];