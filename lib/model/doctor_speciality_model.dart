import 'package:equatable/equatable.dart';

class Speciality extends Equatable{
  final int id;
  final String imgUrl;
  final String name;

  const Speciality ({
    required this.id,
    required this. imgUrl,
    required this.name

  });


  @override
  // TODO: implement props
  List<Object?> get props => [id, imgUrl,name];
  
  static List<Speciality> specialitys=[
      Speciality(id: 1,  imgUrl: "more", name: "All"),
      Speciality(id: 2,  imgUrl: "general.svg", name: "General"),
      Speciality(id: 3,  imgUrl: "dentis.svg", name: "Dentis"),
      Speciality(id: 4,  imgUrl: "ophthal.svg", name: "Ophthal.."),
      Speciality(id: 5,  imgUrl: "nutrition.svg", name: "Nutrition"),
      Speciality(id: 6,  imgUrl: "neurolo.svg", name: "Neurolo.."),
      Speciality(id: 7,  imgUrl: "pediatric.svg", name: "Pediatric"),
      Speciality(id: 8,  imgUrl: "radiolo.svg", name: "Radiolo.."),
      Speciality(id: 9,  imgUrl: "more.svg", name: "More"),
  ];
  }