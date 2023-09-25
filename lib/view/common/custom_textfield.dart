import 'package:flutter/material.dart';
import 'package:medical_app/config/app_constain.dart';

import 'app_style.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.onChange,

  required this.controller,this.enable=true, required this.hintText, required this.keyboardType, this.validator, this.suffixIcon,  this.obscureText, });
  final bool? enable;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.transparent, width: 1),
        color: AppColor.kTextField,
       
      ),
      
      
      child: TextFormField(
        enabled: enable,
        keyboardType: keyboardType,
        obscureText: obscureText?? false,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: appstyle(14, AppColor.secondColor, FontWeight.w500),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.red,width: 0.5)
          ) ,
          focusedBorder:  OutlineInputBorder(
            borderRadius:  BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColor.mainColor,width: 2),
            
            ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.red,width: 0.5)
      ),
          disabledBorder:  OutlineInputBorder(
            borderRadius:  BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColor.secondColor,width: 0.5)
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius:  BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.transparent,width: 0.5),
          ),
          // border: InputBorder.none,
        ),
        controller: controller,
        cursorHeight: 25,
        style: appstyle(14, Colors.black, FontWeight.w500),
        validator: validator,
        onChanged: onChange,
        

    )
    );
  }
}