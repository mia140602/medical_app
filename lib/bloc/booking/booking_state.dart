import 'package:medical_app/model/doctor_model.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class ChooseDoctorSelectedState extends BookingState {
  final Doctor doctor;

  ChooseDoctorSelectedState({required this.doctor});
}

class DateSelectedState extends BookingState {
  final String date;

  DateSelectedState({required this.date});
}

class TimeSelectedState extends BookingState {
  final String time;

  TimeSelectedState({required this.time});
}

class TypeSelectedState extends BookingState {
  final String type;

  TypeSelectedState({required this.type});
}
class PatienProlemState extends BookingState {
  final String problem;

  PatienProlemState({required this.problem});
}

class AppointmentCreatedState extends BookingState {}

class AppointmentCreationFailedState extends BookingState {
  final String error;

  AppointmentCreationFailedState(this.error);
}