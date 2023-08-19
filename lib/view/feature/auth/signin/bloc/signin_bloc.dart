
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medical_app/view/feature/auth/signin/signin_event.dart';
// import 'package:medical_app/services/auth_respository.dart';
// import 'package:medical_app/view/feature/auth/signin/signin_state.dart';

// import '../form_submission_status.dart';

// class SigninBloc extends Bloc<SignInEvent,SigninState>{
//   // final AuthRepositor authRepo;
//   // SigninBloc({
//   //   // this.authRepo
//   //   }):super(SigninState());
//   SigninBloc({}):super(si)

//   @override
//   Stream<SigninState> mapEventToState(SignInEvent event) async*{
//           //email update
//     if( event is SignInUseremailChanged) {
//       yield state.copyWith(useremail: event.useremail);
//       //password update
//     }else if(event is SignInUserpasswordChanged){
//       yield state.copyWith(userpassword: event.userpassword);
//        //form submited
//    } else if(event is SignInSubmitted) {
//     yield state.copyWith(formStatus: FormSubmitting());

//     try {
//       // await authRepo.signIn(state.useremail, state.userpassword);
//       yield state.copyWith(formStatus: SubmissionSuccess());
//     }catch(e) {
//       yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
//     }

//    }
//   }
// }
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

