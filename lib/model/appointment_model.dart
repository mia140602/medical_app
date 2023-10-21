import 'package:medical_app/model/doctor_model.dart';

class AppointmentModel {
  final String id;
  final String patientId;
  final String time;
  final String date;
  final Doctor doctor;
  final String type;
  final String problem;

  AppointmentModel({required this.id, required this.patientId, required this.time, required this.date, required this.doctor, required this.type,
        this.problem=''
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['_id'],
      patientId: json['patientId'],
      time: json['time'],
      date: json['date'],
      type: json['type'],
      problem: json['problem'],
      doctor: Doctor.fromJson(json['doctor']),
    );
  }
  // chuyển đổi đối tượng dart thành đối tượng json để chuyển đến server:
   Map<String, dynamic> toJson() {
    return {
      'doctor': doctor,
      'patientId': patientId,
      'date': date,
      'time': time,
      'type': type,
      'problem': problem,
    };
  }
}

