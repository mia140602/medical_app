import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/constains/app_constain.dart';

class CodeField extends StatefulWidget {
  
   String? oldValue;

  CodeField({Key? key, this.oldValue = '',}) : super(key: key);

  @override
  State<CodeField> createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.oldValue);
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _textEditingController.text = '';
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 73.w,
      height: 61.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.transparent, width: 1),
        color: AppColor.kTextField,
      ),
      child: TextFormField(
        controller: _textEditingController,
        focusNode: _focusNode,
        onChanged: (value) {
          if (value.length == 1 && value == widget.oldValue) {
            FocusScope.of(context).nextFocus();
          }
          widget.oldValue = value;
        },
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "0",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColor.mainColor, width: 2),
          ),
        ),
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onSaved: (value) {
          widget.oldValue=value;
        },
      ),
    );
  }
}
