import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowReview extends StatefulWidget {
  const ShowReview({super.key});

  @override
  State<ShowReview> createState() => _ShowReviewState();
}

class _ShowReviewState extends State<ShowReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20.w,top: 40.h, right: 20.w),
        child: Column(
          
        ),
      ),
    );
  }
}