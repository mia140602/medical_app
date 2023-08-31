// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'appointment_event.dart';
// import 'appointment_state.dart';

// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';

// class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
//   AppointmentBloc() : super(AppointmentState.initial());

//   @override
//   Stream<AppointmentState> mapEventToState(AppointmentEvent event) async* {
//     if (event is AppointmentStatusChanged) {
//       yield AppointmentState(
//         status: event.status,
//         types: state.types,
//       );
//     } else if (event is AppointmentTypeChanged) {
//       yield AppointmentState(
//         status: state.status,
//         types: event.types,
//       );
//     }
//   }
// }