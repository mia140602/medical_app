import '../../../../../model/doctor_model.dart';

abstract class TopDoctorState {}

class DoctorsLoadingState extends TopDoctorState {}

class DoctorsLoadedState extends TopDoctorState {
  final List<Doctor> doctors;

  DoctorsLoadedState({required this.doctors});
}

class DoctorsErrorState extends TopDoctorState {
  final String message;

  DoctorsErrorState({required this.message});
}