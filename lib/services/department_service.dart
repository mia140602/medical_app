import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medical_app/config/app_constant.dart';

import 'package:medical_app/model/department_model.dart';

import '../model/doctor_model.dart';

Future<List<DepartmentModel>> fetchDepartments() async {
  final response = await http.get(Uri.parse(getAllDepartment),);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => DepartmentModel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load departments from API');
  }
}
