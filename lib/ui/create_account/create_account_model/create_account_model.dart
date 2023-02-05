// To parse this JSON data, do
//
//     final createAccountModel = createAccountModelFromJson(jsonString);

import 'dart:convert';

CreateAccountModel createAccountModelFromJson(String str) => CreateAccountModel.fromJson(json.decode(str));

String createAccountModelToJson(CreateAccountModel data) => json.encode(data.toJson());

class CreateAccountModel {
    CreateAccountModel({
        this.username,
        this.password,
        this.totalPoints,
        this.profileImageLink,
        this.city,
        this.state,
    });

    String? username;
    String? password;
    int? totalPoints;
    String? profileImageLink;
    String? city;
    String? state;

    CreateAccountModel copyWith({
        String? username,
        String? password,
        int? totalPoints,
        String? profileImageLink,
        String? city,
        String? state,
    }) => 
        CreateAccountModel(
            username: username ?? this.username,
            password: password ?? this.password,
            totalPoints: totalPoints ?? this.totalPoints,
            profileImageLink: profileImageLink ?? this.profileImageLink,
            city: city ?? this.city,
            state: state ?? this.state,
        );

    factory CreateAccountModel.fromJson(Map<String, dynamic> json) => CreateAccountModel(
        username: json["username"],
        password: json["password"],
        totalPoints: json["totalPoints"],
        profileImageLink: json["profileImageLink"],
        city: json["city"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "totalPoints": totalPoints,
        "profileImageLink": profileImageLink,
        "city": city,
        "state": state,
    };
}
