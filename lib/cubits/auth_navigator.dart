import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/cubits/auth_cubit.dart';
import 'package:medical_app/view/ui/auth/confirmation.dart';
import 'package:medical_app/view/ui/auth/let_you_in.dart';
import 'package:medical_app/view/ui/auth/signUp.dart';

import '../view/ui/auth/signIn.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(builder: (context, state) {
      
   
    return Navigator(
      // pages: [],// không có trang nào được định nghĩa ban đầu cho Navigator.
      pages: [
        if(state== AuthState.letIn) const MaterialPage(child: LetIn()),
        //show signin
        
        //show push animation
         if(state == AuthState.signup|| state== AuthState.confirmSignup || state ==AuthState.signin)...[
          //show signup
          const MaterialPage(child: SignUp()),

          //show confirm signup
          if(state == AuthState.confirmSignup)
              const MaterialPage(child: Confirmation()),
          if(state ==AuthState.signin) const MaterialPage(child: SignUp())
        ]
      
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  });
  }
   
}