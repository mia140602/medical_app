
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/view/ui/auth/signin/signin_event.dart';
import 'package:medical_app/services/auth_respository.dart';
import 'package:medical_app/view/ui/auth/signin/signin_state.dart';

import '../form_submission_status.dart';

class SigninBloc extends Bloc<SignInEvent,SigninState>{
  final AuthRepository authRepo;
  SigninBloc({required this.authRepo}):super(SigninState());

  @override
  Stream<SigninState> mapEventToState(SignInEvent event) async*{
          //email update
    if( event is SignInUseremailChanged) {
      yield state.copyWith(useremail: event.useremail);
      //password update
    }else if(event is SignInUserpasswordChanged){
      yield state.copyWith(userpassword: event.userpassword);
       //form submited
   } else if(event is SignInSubmitted) {
    yield state.copyWith(formStatus: FormSubmitting());

    try {
      await authRepo.signIn(state.useremail, state.userpassword);
      yield state.copyWith(formStatus: SubmissionSuccess());
    }catch(e) {
      yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
    }

   }
  }
}
