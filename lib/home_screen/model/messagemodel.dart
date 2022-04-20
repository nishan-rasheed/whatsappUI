// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
    Message({
        this.isSend,
        this.isRead,
        this.message,
        this.sendAt,
    });

    bool? isSend;
    bool? isRead;
    String? message;
    String? sendAt;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        isSend: json["isSend"],
        isRead: json["isRead"],
        message: json["message"],
        sendAt: json[" sendAt"],
    );

    Map<String, dynamic> toJson() => {
        "isSend": isSend,
        "isRead": isRead,
        "message": message,
        " sendAt": sendAt,
    };
}
