
import 'package:bloc/bloc.dart';
import 'package:medical_app/view/feature/auth/signin/bloc/signin_event.dart';
import 'package:medical_app/view/feature/auth/signin/bloc/signin_state.dart';

class SigninBloc extends Bloc<SignInEvent, SigninState>{
  SigninBloc():super( SigninState()){
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(email: event.email));
    // print("My email: ${event.email}");
  }
  void _passwordEvent(PasswordEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(password: event.password));
    // print("My password: ${event.password}");

  }
}

