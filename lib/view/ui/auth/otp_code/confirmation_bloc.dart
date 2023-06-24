import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/cubits/auth_cubit.dart';
import 'package:medical_app/view/ui/auth/otp_code/confirmation_event.dart';
import 'package:medical_app/services/auth_respository.dart';
import 'package:medical_app/view/ui/auth/otp_code/confirmation_state.dart';
import 'package:medical_app/view/ui/auth/form_submission_status.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent,ConfirmationState>{
  final AuthRepository authRepo;
  final AuthCubit authCubit;
  ConfirmationBloc({required this.authRepo, required this.authCubit}):super (ConfirmationState());

  @override
  Stream<ConfirmationState> mapEventToState(ConfirmationEvent event) async* {
    //confirmation code updated
    if (event is ConfirmationCodeChange){
      yield state.copyWith(code: event.code);
    //form submitted
    }else if(event is ConfirmationSubmitted){
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.confirmSignUp(authCubit.credentials.useremail, state.code);
        yield state.copyWith(formStatus: SubmissionSuccess());
      }catch(e) {
        yield state.copyWith(formStatus:  SubmissionFailed(e as Exception));
      }

    }
  }
}