import 'package:medical_app/model/doctor_model.dart';

abstract class BookingEvent {}

class ChooseSelectDoctorEvent extends BookingEvent {
  final Doctor doctor;

  ChooseSelectDoctorEvent(this.doctor);
}

class SelectDateEvent extends BookingEvent {
  final String date;

  SelectDateEvent(this.date);
}

class SelectTimeEvent extends BookingEvent {
  final String time;

  SelectTimeEvent(this.time);
}

class SelectTypeEvent extends BookingEvent {
  final String type;

  SelectTypeEvent(this.type);
}
class PatientProblemEvent extends BookingEvent {
  final String problem;

  PatientProblemEvent(this.problem);
}
class CreateAppointmentEvent extends BookingEvent {}