import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medical_app/config/app_constain.dart';

class RememberMe extends StatefulWidget {

   RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Checkbox(
       
        value: rememberMe,
        onChanged: (value) {
          setState(() {
            rememberMe = value!;
          });
        
        },
        activeColor: AppColor.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          
        ),
        side: BorderSide(color: AppColor.mainColor,width: 2),
      ),
      Text("Remember Me",selectionColor: AppColor.textColor1,),
    ],
  ),
    );
  }
}