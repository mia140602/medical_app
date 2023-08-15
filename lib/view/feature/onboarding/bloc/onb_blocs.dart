import 'package:bloc/bloc.dart';
import 'package:medical_app/view/feature/onboarding/bloc/onb_events.dart';
import 'package:medical_app/view/feature/onboarding/bloc/onb_states.dart';

class OnbBloc extends Bloc<OnbEvent,OnbState> {
  OnbBloc():super(OnbState()){
    on<OnbEvent>((event, emit) {
      emit(OnbState(page: state.page));
    },);
  }
}