// import 'dart:math';

// import 'package:equatable/equatable.dart';
// import 'package:medical_app/model/doctor_model.dart';

// class Hospital extends Equatable{
//   final int id;
//   final String name;
//   final String located;
//   final List<Doctor> doctors;

//   Hospital({
//     required this.id, 
//     required this.name,
//     required this.located,
//     required this.doctors
//     });



//   @override
//   // TODO: implement props
//   List<Object?> get props => [id, name, located];
  
//   static List<Hospital> hospital=[
//    Hospital(id: 1, name: "Bir", located: "Hai Ba Trung, Ha Noi, Viet Nam", doctors: Doctor.doctors.where((doctors) => doctors.hospitalId==1).toList()),
//    Hospital(id: 2, name: "Bach Mai", located: "Hai Ba Trung, Ho Chi Minh, Viet Nam",
//    doctors: Doctor.doctors.where((doctors) => doctors.hospitalId==2).toList()
//    ),
//    Hospital(id: 3, name: "108", located: "Thanh Xuan, Ha Noi, Viet Nam", doctors: Doctor.doctors.where((doctors) => doctors.hospitalId==1).toList()),
//   ];
//   }