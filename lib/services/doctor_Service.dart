import 'package:http/http.dart' as http;
import 'package:medical_app/config/app_constant.dart';
import 'dart:convert';

import '../model/doctor_model.dart';

class DoctorService {
  static Future<List<Doctor>> fetchDoctors() async {
    final response = await http.get(Uri.parse(getDoctor));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Doctor.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load doctors');
    }
  }
}