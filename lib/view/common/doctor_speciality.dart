
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/config/app_constant.dart';


import 'package:flutter/material.dart';
import 'package:medical_app/model/department_model.dart';
import 'package:medical_app/services/department_service.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DepartmentModel>>(
      future: fetchDepartments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return Wrap(
            spacing: 24.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: List.generate(snapshot.data!.length, (index) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/topDoctor'),
                child: Column(
                  children: [
                    Image.network(
                      "${snapshot.data![index].imgPath}",
                      color: AppColor.mainColor,
                      width: 60.w,
                    ),
                    SizedBox(height: 6.h),
                    Text(snapshot.data![index].departmentName),
                  ],
                ),
              );
            }),
          );
        }
      },
    );
  }
}


