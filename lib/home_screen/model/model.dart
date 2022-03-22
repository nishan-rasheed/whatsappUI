// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        this.avatar,
        this.name,
        this.isGroup,
        this.updateAt,
        this.message,
        
    });

    String? avatar;
    String ?name;
    bool ?isGroup;
    String ?updateAt;
    String ?message;
    

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        avatar: json["avatar"],
        name: json["name"],
        isGroup: json["isGroup"],
        updateAt: json["updateAt"],
        message: json["message"],
        
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "isGroup": isGroup,
        "updateAt": updateAt,
        "message": message,
        
    };
}
