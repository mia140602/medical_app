

import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignUpEvent,SignupState>{

  SignupBloc():super(const SignupState()){
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignupState> emit){
    emit(state.copyWith(email: event.email));
    print("${event.email}");
  }
  void _passwordEvent(PasswordEvent event, Emitter<SignupState> emit){
    emit(state.copyWith(password: event.password));
    print("${event.password}");
  }

  // final AuthRepository authRepo;
  // SignupBloc({required this.authRepo}):super(SignupState());

  // @override
  // Stream<SignupState> mapEventToState(SignUpEvent event) async*{
  //         //email update
  //   if( event is SignUpUseremailChanged) {
  //     yield state.copyWith(useremail: event.useremail);
  //     //password update
  //   }else if(event is SignUpUserpasswordChanged){
  //     yield state.copyWith(userpassword: event.userpassword);
  //      //form submited
  //  } else if(event is SignUpSubmitted) {
  //   yield state.copyWith(formStatus: FormSubmitting());

  //   try {
  //     await authRepo.signUp(state.useremail,state.userpassword);
  //     yield state.copyWith(formStatus: SubmissionSuccess());
  //   }catch(e) {
  //     yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
  //   }

  //  }
  // }
}
