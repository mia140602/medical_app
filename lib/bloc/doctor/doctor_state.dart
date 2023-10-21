import '../../model/doctor_model.dart';

abstract class DoctorState {}

class DoctorSelectedState extends DoctorState {
  final Doctor doctor;

  DoctorSelectedState(this.doctor);
}