class DepartmentModel {
  final String id;
  final String departmentName;
  final String imgPath;

  DepartmentModel({required this.id, required this.departmentName, required this.imgPath});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['_id'],
      departmentName: json['department_name'],
      imgPath: json['img_path'],
    );
  }
}