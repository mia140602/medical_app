import 'package:bloc/bloc.dart';
import 'package:medical_app/bloc/doctor/doctor_event.dart';
import 'package:medical_app/bloc/doctor/doctor_state.dart';

import '../../model/doctor_model.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc() : super(DoctorSelectedState(Doctor.initial())) {
    on<SelectDoctorEvent>((event, emit) {
      emit(DoctorSelectedState(event.doctor));
    });
  }
}