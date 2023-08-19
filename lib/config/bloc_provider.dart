import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/feature/auth/signin/bloc/signin_bloc.dart';
import '../view/feature/auth/signup/bloc/signup_bloc.dart';
import '../view/feature/onboarding/bloc/onb_blocs.dart';

class AppBlocProvider{
  static get allBlocProviders => [
    //  bạn có thể sử dụng lazy = true để trì hoãn việc tạo Bloc cho đến khi nó thực sự cần thiết.
      // Nếu bạn muốn đảm bảo rằng Bloc luôn được tạo ngay khi widget cha được tạo, bạn có thể sử dụng lazy = false.
        BlocProvider(lazy: false,create: (context) => OnbBloc(),),
        BlocProvider(create: (context)=> SigninBloc()),
        BlocProvider(create: (context)=> SignupBloc()),
  ];
}