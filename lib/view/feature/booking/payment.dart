import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/bloc/booking/booking_bloc.dart';
import 'package:medical_app/view/feature/application/application_page.dart';
import 'package:medical_app/widgets/flutter_toast.dart';

import '../../../bloc/booking/booking_event.dart';
import '../../../config/app_constant.dart';
import '../../common/app_style.dart';
import '../../common/custom_btn.dart';
import '../../common/title_section.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: EdgeInsets.only(
                top: 40.h, left: 20.w, right: 20.w, bottom: 40.h),
        child: Column(
          children: [
            TitleSection(
                text: "Payment", imagePaths: ["scan.svg"],
              ),
            SizedBox(height: 24.h,),
            Text("Chọn phương thức thanh toán bạn muốn sử dụng'",style: appstyle(18.sp, AppColor.secondColor, FontWeight.normal),),
            SizedBox(height: 24.h,),
            Container(
              decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24))
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/zalopay.svg",width: 100.w,)
                ],

              ),
            ),
            SizedBox(height: 200,
            child: Text("Chức năng này đang trong quá trình triển khai"),
            ),
            SizedBox(height: 200.h,),
            Align(
              alignment: Alignment.bottomCenter,
              child:  GestureDetector(
                onTap: () {
                  print('Booking Data: ${context.read<BookingBloc>().bookingData}');
                  context.read<BookingBloc>().add(CreateAppointmentEvent());
                  toastInfo(msg: "Đặt lịch thành công");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ApplicationPage())
                  );
                                  
                },
                child: CustomButton(text: "Xác Nhận đặt lịch", width: double.maxFinite, height: 50,
                              outlineBtnColor: AppColor.mainColor, textColor: Colors.white,color: AppColor.mainColor,
                              ),
              ),
            )

          ],
        ),
      ),
    );
  }
}