import 'mess_model.dart';

class Conversation {
  final String id;
  final String userId;
  final String doctorId;
  final DateTime startTime;
  final Message latestMessage;

  Conversation({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.startTime,
    required this.latestMessage,
  });
Conversation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        doctorId = json['doctorId'],
        startTime = DateTime.parse(json['startTime']),
        latestMessage = Message.fromJson(json['latestMessage']);
}