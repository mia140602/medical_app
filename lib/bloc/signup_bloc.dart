

import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/signup_event.dart';
import '../services/auth_respository.dart';
import '../state/signup_state.dart';
import '../view/ui/auth/form_submission_status.dart';

class SignupBloc extends Bloc<SignUpEvent,SignupState>{
  final AuthRepository authRepo;
  SignupBloc({required this.authRepo}):super(SignupState());

  @override
  Stream<SignupState> mapEventToState(SignUpEvent event) async*{
          //email update
    if( event is SignUpUseremailChanged) {
      yield state.copyWith(useremail: event.useremail);
      //password update
    }else if(event is SignUpUserpasswordChanged){
      yield state.copyWith(userpassword: event.userpassword);
       //form submited
   } else if(event is SignUpSubmitted) {
    yield state.copyWith(formStatus: FormSubmitting());

    try {
      await authRepo.signUp(state.useremail,state.userpassword);
      yield state.copyWith(formStatus: SubmissionSuccess());
    }catch(e) {
      yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
    }

   }
  }
}
