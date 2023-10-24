import 'package:medical_app/model/response/chat/get_chat_model.dart';

abstract class ChatState {}

class ChatLoadingState extends ChatState {}

class ChatLoadedState extends ChatState {
  final List<GetChat> chats;

  ChatLoadedState(this.chats);
}

class ChatErrorState extends ChatState {}

class PrefsLoadedState extends ChatState {
  final String userId;

  PrefsLoadedState(this.userId);
}
