import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/config/app_constain.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    List<DoctorIcon> doctorIcon= [
      DoctorIcon(icon: "general.svg", name: "General"),
      DoctorIcon(icon: "dentis.svg", name: "Dentis"),
      DoctorIcon(icon: "ophthal.svg", name: "Ophthal.."),
      DoctorIcon(icon: "nutrition.svg", name: "Nutrition"),
      DoctorIcon(icon: "neurolo.svg", name: "Neurolo.."),
      DoctorIcon(icon: "pediatric.svg", name: "Pediatric"),
      DoctorIcon(icon: "radiolo.svg", name: "Radiolo.."),
      DoctorIcon(icon: "more.svg", name: "More"),
    ];
    return Wrap(
      spacing: 24.0, // Khoảng cách giữa các widget theo chiều ngang
      runSpacing: 10.0, // Khoảng cách giữa các widget theo chiều dọc
      alignment: WrapAlignment.start, // Vị trí căn chỉnh các widget trong Wrap
      crossAxisAlignment: WrapCrossAlignment.start,
      children: List.generate(doctorIcon.length, (index) {
        return Column(
        children: [
          SvgPicture.asset("assets/icons/list_special/"+doctorIcon[index].icon, color: AppColor.mainColor,width: 60.w,),
          SizedBox(height: 6.h,),
          Text(doctorIcon[index].name),
        ],
      );
      })
    );
  }
}
class DoctorIcon {
  String icon;
  String name;


  DoctorIcon({required this.icon, required this.name});
}

class Detail{
  String svgPath;
  String number;
  String st;
  
  Detail({required this.svgPath,required this.number,required this.st});


}