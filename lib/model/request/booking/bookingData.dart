class BookingData {
  String doctor;
  String patientId;
  String date;
  String time;
  String type;
  String problem;

  BookingData({
    required this.doctor,
    required this.patientId,
    required this.date,
    required this.time,
    required this.type,
    required this.problem,
  });
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

  @override
  String toString() {
    return 'BookingData(doctor: $doctor, patientId: $patientId, date: $date, time: $time, type: $type, problem: $problem)';
  }
}