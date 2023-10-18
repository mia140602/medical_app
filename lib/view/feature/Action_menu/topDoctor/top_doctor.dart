import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/view/common/title_section.dart';

import '../../../../config/app_constant.dart';
import '../../../common/custom_btn.dart';
import '../../../common/doctor_cart.dart';
import '../../../common/doctor_speciality.dart';
import 'bloc/topDoctor_bloc.dart';
import 'bloc/topDoctor_event.dart';
import 'bloc/topDoctor_state.dart';

class TopDoctor extends StatefulWidget {

  
  const TopDoctor({super.key});

  @override
  State<TopDoctor> createState() => _TopDoctorState();
}

class _TopDoctorState extends State<TopDoctor> {
  late TopDoctorBloc _bloc;
    List<DoctorIcon> doctorIcon= [
      DoctorIcon(icon: "more", name: "All"),
      DoctorIcon(icon: "general.svg", name: "General"),
      DoctorIcon(icon: "dentis.svg", name: "Dentis"),
      DoctorIcon(icon: "ophthal.svg", name: "Ophthal.."),
      DoctorIcon(icon: "nutrition.svg", name: "Nutritionít"),
      DoctorIcon(icon: "neurolo.svg", name: "Neurolo.."),
      DoctorIcon(icon: "pediatric.svg", name: "Pediatric"),
      DoctorIcon(icon: "radiolo.svg", name: "Radiologycal"),
      DoctorIcon(icon: "more.svg", name: "More"),
    ];
    @override
  void initState() {
    super.initState();
    _bloc = TopDoctorBloc();
    _bloc.add(GetDoctorsEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w, bottom: 60.h),
        child: BlocBuilder<TopDoctorBloc, TopDoctorState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is DoctorsLoadingState) {
              return CircularProgressIndicator();
            } else if (state is DoctorsLoadedState) {
              return SingleChildScrollView(
          child: Column(
            children: [
              TitleSection(text: "Top Doctor", imagePaths: ["Search.svg","more.svg"],),
              SizedBox(height: 20.h,),
              SizedBox(
              
              height: 50.h,
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: doctorIcon.length,
                itemBuilder: (context,index) {
                  return CustomButton(
                    text: doctorIcon[index].name, 
                    width: 100, 
                    wrapContentWidth: true,
                    height: 50.h,
                    outlineBtnColor: AppColor.mainColor,
                    textColor: AppColor.mainColor,
                    );
                }),
            ),
            SizedBox(height: 24.h,),
                Column(
                  children:state.doctors.map((doctor) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,'/detail' );
                      },
                      child: DoctorCart(
                        imgPath: doctor.avatar ?? "assets/img/doctor1.png", // Sử dụng ảnh từ API nếu có, nếu không sẽ sử dụng ảnh mặc định
                        doctorName: doctor.userName,
                        category: doctor.department ?? "Unknown", // Sử dụng department từ API nếu có, nếu không sẽ hiển thị "Unknown"
                        clinic: "Phong kham1", // Bạn cần thay thế bằng dữ liệu từ API nếu có
                      ),
                    );
                  }).toList(),
                )
            ],
          ),
        );
            
            } else if (state is DoctorsErrorState) {
              return Text(state.message);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
   @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
