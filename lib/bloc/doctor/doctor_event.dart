import '../../model/doctor_model.dart';

abstract class DoctorEvent {}

class SelectDoctorEvent extends DoctorEvent {
  final Doctor doctor;

  SelectDoctorEvent(this.doctor);
}