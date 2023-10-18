
//
//     final sendMess = sendMessFromJson(jsonString);

import 'dart:convert';

SendMess sendMessFromJson(String str) => SendMess.fromJson(json.decode(str));

String sendMessToJson(SendMess data) => json.encode(data.toJson());

class SendMess {
    String content;
    String chatId;
    String doctorId;

    SendMess({
        required this.content,
        required this.chatId,
        required this.doctorId,
    });

    factory SendMess.fromJson(Map<String, dynamic> json) => SendMess(
        content: json["content"],
        chatId: json["chatId"],
        doctorId: json["doctorId"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "chatId": chatId,
        "doctorId": doctorId,
    };
}
