
class SignupState{
  final String email;
  final String password;


  const SignupState({this.email='',
  this.password='',}
  // this.formStatus= const InitialFormStatus(),
  );
  SignupState copyWith({String? email,
      String? password,
      // FormSubmissionStatus? formStatus,
  }){
    return SignupState(
       email: email?? this.email,
      password: password?? this.password,
      // formStatus: formStatus?? this.formStatus,
    );
  }
 
  
}


//thread safe
