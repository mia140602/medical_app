
import 'dart:convert';

List<ReceivedMessage> receivedMessageFromJson(String str) => List<ReceivedMessage>.from(json.decode(str).map((x) => ReceivedMessage.fromJson(x)));

// String receivedMessageToJson(List<ReceivedMessage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReceivedMessage {
    String id;
    String content;
    Chat chat;
    Sender sender;
    String receiver;
    String onModelSender;
    String onModelReceiver;
    DateTime timestamp;
    int v;

    ReceivedMessage({
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

    factory ReceivedMessage.fromJson(Map<String, dynamic> json) => ReceivedMessage(
        id: json["_id"],
        content: json["content"],
        chat: Chat.fromJson(json["chat"]),
        sender: Sender.fromJson(json["sender"]),
        receiver: json["receiver"],
        onModelSender: json["onModelSender"],
        onModelReceiver: json["onModelReceiver"],
        timestamp: DateTime.parse(json["timestamp"]),
        v: json["__v"],
    );

    // Map<String, dynamic> toJson() => {
    //     "_id": id,
    //     "content": content,
    //     "chat": chat.toJson(),
    //     "sender": sender.toJson(),
    //     "receiver": receiver,
    //     "onModelSender": onModelSender,
    //     "onModelReceiver": onModelReceiver,
    //     "timestamp": timestamp.toIso8601String(),
    //     "__v": v,
    // };
}

class Chat {
    String id;
    String user;
    Doctor doctor;
    DateTime startTime;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String latestMessage;

    Chat({
        required this.id,
        required this.user,
        required this.doctor,
        required this.startTime,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.latestMessage,
    });

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["_id"],
        user: json["user"],
        doctor: Doctor.fromJson(json["doctor"]),
        startTime: DateTime.parse(json["startTime"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        latestMessage: json["latestMessage"],
    );

    // Map<String, dynamic> toJson() => {
    //     "_id": id,
    //     "user": user,
    //     "doctor": doctor.toJson(),
    //     "startTime": startTime.toIso8601String(),
    //     "createdAt": createdAt.toIso8601String(),
    //     "updatedAt": updatedAt.toIso8601String(),
    //     "__v": v,
    //     "latestMessage": latestMessage,
    // };
}

class Doctor {
    String id;
    String userName;
    String email;

    Doctor({
        required this.id,
        required this.userName,
        required this.email,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["_id"],
        userName: json["userName"],
        email: json["email"],
    );

    // Map<String, dynamic> toJson() => {
    //     "_id": id,
    //     "userName": userName,
    //     "email": email,
    // };
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

    // Map<String, dynamic> toJson() => {
    //     "_id": id,
    //     "email": email,
    // };
}
