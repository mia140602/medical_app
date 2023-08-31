import 'package:bloc/bloc.dart';
import 'package:medical_app/view/feature/application/bloc/app_events.dart';
import 'package:medical_app/view/feature/application/bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvent,AppStates>{
  AppBlocs():super(const AppStates()){
    on<TriggerAppEvent>((event,emit){
      // print("My tappted index: ${event.index}");
    emit(AppStates(index: event.index));
  });
  }
  
}
