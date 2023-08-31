// import 'package:equatable/equatable.dart';


// abstract class AppointmentState extends Equatable {
//   const AppointmentState();

//   @override
//   List<Object?> get props => [];
// }

// class AppointmentInitial extends AppointmentState {}

// class AppointmentsLoaded extends AppointmentState {
//   final List<dynamic> filteredSchedules;

//   AppointmentsLoaded({required this.filteredSchedules});

//   @override
//   List<Object?> get props => [filteredSchedules];
// }
import 'dart:async';

class AppointmentState {
  const AppointmentState({
    this.status = AppointmentStatus.upcoming,
    this.types = const [AppointmentType.messaging],
  });

  final AppointmentStatus status;
  final List<AppointmentType> types;

  static const AppointmentState initial = AppointmentState();
}

enum  AppointmentStatus { upcoming, completed, cancel }

enum AppointmentType { messaging, video, call, offline }