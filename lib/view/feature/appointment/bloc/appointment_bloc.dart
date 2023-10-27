import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:medical_app/view/feature/appointment/bloc/appointment_event.dart';
import 'package:medical_app/view/feature/appointment/bloc/appointment_state.dart';
import '../../../../services/appointment_service.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(AppointmentInitial()) {
    on<LoadAppointments>(loadAppointments);
  }

  Future<void> loadAppointments(LoadAppointments event, Emitter<AppointmentState> emit) async {
  emit(AppointmentLoading());
  try {
    final appointments = await AppointmentService.fetchAppointments();
    emit(AppointmentsLoaded(appointments: appointments));
  } catch (error) {
    print('Error loading appointments: $error');
    emit(AppointmentError());
  }
}
}