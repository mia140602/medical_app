// To parse this JSON data, do
//
//     final createChat = createChatFromJson(jsonString);

import 'dart:convert';

CreateChat createChatFromJson(String str) => CreateChat.fromJson(json.decode(str));

String createChatToJson(CreateChat data) => json.encode(data.toJson());

class CreateChat {
    String doctorId;

    CreateChat({
        required this.doctorId,
    });

    factory CreateChat.fromJson(Map<String, dynamic> json) => CreateChat(
        doctorId: json["doctorId"],
    );

    Map<String, dynamic> toJson() => {
        "doctorId": doctorId,
    };
}
