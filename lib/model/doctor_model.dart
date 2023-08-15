

import 'package:equatable/equatable.dart';

class Doctor extends Equatable{
  final int id;
  final String name;
  final String imgUrl;
  final String speciality;
  final int hospitalId;
  final String? description;

  const Doctor({
    required this.id,
    required this.name,
    required this.imgUrl, 
    required this.speciality,
    required this.hospitalId,
    this.description
  });
  
  @override
  // TODO: implement props
  // List<Object?> get props => [name, imgUrl];// khi so sánh 2 doctor nếu name và imgUrl bằng nhau thì nó sẽ cho là đó là bằng nhau
  @override
  List<Object?> get props => [id,name, speciality, hospitalId];


  static List<Doctor> doctors= [
  Doctor(id: 1, name: "Jenny Watson", imgUrl: 'assets/img/doctor1.png', speciality: 'Immunologists', hospitalId: 1),
  Doctor(id:2, name: "Beckett Calger", imgUrl: 'assets/img/doctor2.png', speciality: 'Cardiologists', hospitalId: 2),
  Doctor(id: 3, name: "Iker Holl", imgUrl: 'assets/img/doctor3.png', speciality: 'Cardiologists', hospitalId: 3),
];
}
