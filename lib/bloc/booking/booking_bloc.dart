import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medical_app/services/appointment_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../model/request/booking/bookingData.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
    BookingData bookingData = BookingData(
        doctor: '',
        patientId: '',
        date: '',
        time: '',
        type: '',
        problem: '',
      );

  BookingBloc() : super(BookingInitial()) {
    on<ChooseSelectDoctorEvent>((event, emit) {
       bookingData.doctor = event.doctor.id;
       print('Doctor ID: ${bookingData.doctor}');
      emit(ChooseDoctorSelectedState(doctor: event.doctor));
    });

    on<SelectDateEvent>((event, emit) {
       bookingData.date = event.date;
       print('Date: ${bookingData.date}');
      emit(DateSelectedState(date: event.date));
    });

    on<SelectTimeEvent>((event, emit) {
      bookingData.time = event.time;
      print('time: ${bookingData.time}');
      emit(TimeSelectedState(time: event.time));
    });

    on<SelectTypeEvent>((event, emit) {
      bookingData.type = event.type;
      print('type: ${bookingData.type}');
      emit(TypeSelectedState(type: event.type));
    });

    on<PatientProblemEvent>((event, emit) {
      bookingData.problem = event.problem;
      emit(PatienProlemState(problem: event.problem));
    });

    on<CreateAppointmentEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString('userId');
  bookingData.patientId = userId??"";
  print("Kết quả booking data");
  print(bookingData);
  try {
    await AppointmentService().createAppointment(bookingData);
    emit(AppointmentCreatedState());
  } catch (e) {
    emit(AppointmentCreationFailedState(e.toString()));
  }
});

  }
}


