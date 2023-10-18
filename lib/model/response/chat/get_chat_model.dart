// To parse this JSON data, do
//
//     final getChat = getChatFromJson(jsonString);

import 'dart:convert';

// GetChat getChatFromJson(String str) => GetChat.fromJson(json.decode(str));

// String getChatToJson(GetChat data) => json.encode(data.toJson());
List<GetChat> getChatFromJson(String str) => List<GetChat>.from(json.decode(str).map((x) => GetChat.fromJson(x)));

String getChatToJson(List<GetChat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetChat {
    String id;
    String doctor;
    DateTime startTime;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    LatestMessage latestMessage;

    GetChat({
        required this.id,
        required this.doctor,
        required this.startTime,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.latestMessage,
    });

    factory GetChat.fromJson(Map<String, dynamic> json) => GetChat(
        id: json["_id"],
        doctor: json["doctor"],
        startTime: DateTime.parse(json["startTime"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        latestMessage: LatestMessage.fromJson(json["latestMessage"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "doctor": doctor,
        "startTime": startTime.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "latestMessage": latestMessage.toJson(),
    };
}

class LatestMessage {
    String id;
    String content;
    String chat;
    Sender sender;
    String receiver;
    String onModelSender;
    String onModelReceiver;
    DateTime timestamp;
    int v;

    LatestMessage({
        required this.id,
        required this.content,
        required this.chat,
        required this.sender,
        required this.receiver,
        required this.onModelSender,
        required this.onModelReceiver,
        required this.timestamp,
        required this.v,
    });

    factory LatestMessage.fromJson(Map<String, dynamic> json) => LatestMessage(
        id: json["_id"],
        content: json["content"],
        chat: json["chat"],
        sender: Sender.fromJson(json["sender"]),
        receiver: json["receiver"],
        onModelSender: json["onModelSender"],
        onModelReceiver: json["onModelReceiver"],
        timestamp: DateTime.parse(json["timestamp"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "chat": chat,
        "sender": sender.toJson(),
        "receiver": receiver,
        "onModelSender": onModelSender,
        "onModelReceiver": onModelReceiver,
        "timestamp": timestamp.toIso8601String(),
        "__v": v,
    };
}

class Sender {
    String id;
    String email;

    Sender({
        required this.id,
        required this.email,
    });

    factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["_id"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
    };
}
