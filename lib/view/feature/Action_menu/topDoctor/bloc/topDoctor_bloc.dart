import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/view/feature/Action_menu/topDoctor/bloc/topDoctor_event.dart';
import 'package:medical_app/view/feature/Action_menu/topDoctor/bloc/topDoctor_state.dart';

import '../../../../../model/doctor_model.dart';
import '../../../../../services/doctor_Service.dart';

class TopDoctorBloc extends Bloc<TopDoctorEvent, TopDoctorState> {
  TopDoctorBloc() : super(DoctorsLoadingState()) {
    on<GetDoctorsEvent>((event, emit) async {
      emit(DoctorsLoadingState());
      try {
        List<Doctor> doctors = await DoctorService.fetchDoctors();
        emit(DoctorsLoadedState(doctors: doctors));
      } catch (e) {
        emit(DoctorsErrorState(message: e.toString()));
      }
    });
  }
}