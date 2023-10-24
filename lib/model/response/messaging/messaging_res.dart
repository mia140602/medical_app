import 'package:medical_app/model/doctor_model.dart';

class ReceivedMessage {
  final String id;
  final String content;
  final Chat chat;
  final Sender sender;
  final String receiver;
  final String onModelSender;
  final String onModelReceiver;
  final DateTime timestamp;

  ReceivedMessage({
    required this.id,
    required this.content,
    required this.chat,
    required this.sender,
    required this.receiver,
    required this.onModelSender,
    required this.onModelReceiver,
    required this.timestamp,
  });

  factory ReceivedMessage.fromJson(Map<String, dynamic> json) {
    return ReceivedMessage(
      id: json['_id'],
      content: json['content'],
      chat: Chat.fromJson(json['chat']),
      sender: Sender.fromJson(json['sender']),
      receiver: json['receiver'],
      onModelSender: json['onModelSender'],
      onModelReceiver: json['onModelReceiver'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'content': content,
      'chat': chat.toJson(),
      'sender': sender.toJson(),
      'receiver': receiver,
      'onModelSender': onModelSender,
      'onModelReceiver': onModelReceiver,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class Chat {
  final String id;
  final String user;
  final Doctor doctor;
  final DateTime startTime;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String latestMessage;

  Chat({
    required this.id,
    required this.user,
    required this.doctor,
    required this.startTime,
    required this.createdAt,
    required this.updatedAt,
    required this.latestMessage,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['_id'],
      user: json['user'],
      doctor: Doctor.fromJson(json['doctor']),
      startTime: DateTime.parse(json['startTime']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      latestMessage: json['latestMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user,
      'doctor': doctor.toJson(),
      'startTime': startTime.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'latestMessage': latestMessage,
    };
  }
}

class Sender {
  final String id;
  final String email;

  Sender({
    required this.id,
    required this.email,
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['_id'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
    };
  }
}