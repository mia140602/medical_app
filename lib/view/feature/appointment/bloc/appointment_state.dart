import 'package:equatable/equatable.dart';
import 'package:medical_app/model/appointment_model.dart';

abstract class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object> get props => [];
}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentsLoaded extends AppointmentState {
  final List<AppointmentModel> appointments;

  AppointmentsLoaded({required this.appointments});

  @override
  List<Object> get props => [appointments];
}

class AppointmentError extends AppointmentState {}