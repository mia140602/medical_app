import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/bloc/chat/chat_event.dart';
import 'package:medical_app/bloc/chat/chat_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/helpers/chat_helper.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatLoadingState()) {
    on<GetChatsEvent>((event, emit) async {
      emit(ChatLoadingState());
      try {
        final chats = await ChatHelper.getConversations();
        emit(ChatLoadedState(chats));
      } catch (e) {
        emit(ChatErrorState());
        print('Error getting chats: $e');
      }
    });

    on<GetPrefsEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      if (userId != null) {
        emit(PrefsLoadedState(userId));
      } else {
        emit(ChatErrorState());
      }
    });
    add(GetChatsEvent());
  }

  String msgTime(String timestamp) {
    DateTime now = DateTime.now();
    DateTime messageTime = DateTime.parse(timestamp);

    if (now.year == messageTime.year &&
        now.month == messageTime.month &&
        now.day == messageTime.day) {
      return DateFormat.Hm().format(messageTime);
    } else if (now.year == messageTime.year &&
        now.month == messageTime.month &&
        now.day - messageTime.day == 1) {
      return "Yesterday";
    } else {
      return DateFormat.yMd().format(messageTime);
    }
  }
  
}