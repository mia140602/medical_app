import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/model/appointment_model.dart';
import 'package:http/http.dart' as http;

import '../model/request/booking/bookingData.dart';
class AppointmentService {
  

  AppointmentService();

  Future<AppointmentModel> createAppointment(BookingData bookingData) async {
    final response = await http.post(
      Uri.parse(userCreatAppointment),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(bookingData.toJson()),
    );

    if (response.statusCode == 201) {
      return AppointmentModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create appointment.');
    }
  }



}
    Future<List<String>> fetchTimeAppointment(String doctorId, String date) async {
      final response = await https.get(Uri.parse(getDoctorAppointment+'?doctorId=$doctorId&date=$date'));

      if (response.statusCode == 200) {
        List<String> jsonResponse = List<String>.from(json.decode(response.body));
        return jsonResponse;
      } else {
        throw Exception('Unexpected error occured!');
      }
    }

