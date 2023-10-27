import 'package:medical_app/model/doctor_model.dart';

enum AppointmentStatus { unconfirmed, confirmed, rejected }

class AppointmentModel {
  final String id;
  final String patientId;
  final String time;
  final String date;
  final Doctor doctor;
  final String type;
  final String problem;
  final String status;

  AppointmentModel({
    required this.id, 
    required this.patientId, 
    required this.time, 
    required this.date, 
    required this.doctor, 
    required this.type,
    this.problem='', 
    required this.status
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
      status: json['status'],
    );
  }

  // Chuyển đổi đối tượng Dart thành đối tượng JSON để gửi đến server:
  Map<String, dynamic> toJson() {
    return {
      'doctor': doctor,
      'patientId': patientId,
      'date': date,
      'time': time,
      'type': type,
      'problem': problem,
      'status': status,
    };
  }

  // Hàm chuyển đổi trạng thái cuộc hẹn từ dạng String sang AppointmentStatus
  static AppointmentStatus _parseStatus(String status) {
    switch (status) {
      case 'Xác nhận':
        return AppointmentStatus.confirmed;
      case 'Từ chối':
        return AppointmentStatus.rejected;
      default:
        return AppointmentStatus.unconfirmed;
    }
  }

  // Hàm chuyển đổi trạng thái cuộc hẹn từ dạng AppointmentStatus sang String
  static String _statusToString(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.confirmed:
        return 'Xác nhận';
      case AppointmentStatus.rejected:
        return 'Từ chối';
      default:
        return 'Chưa xác nhận';
    }
  }
}