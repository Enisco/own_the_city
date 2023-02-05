// To parse this JSON data, do
//
//     final UserAccountModel = UserAccountModelFromJson(jsonString);

import 'dart:convert';

UserAccountModel userAccountModelFromJson(String str) =>
    UserAccountModel.fromJson(json.decode(str));

String userAccountModelToJson(UserAccountModel data) =>
    json.encode(data.toJson());

class UserAccountModel {
  UserAccountModel({
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

  UserAccountModel copyWith({
    String? username,
    String? password,
    int? totalPoints,
    String? profileImageLink,
    String? city,
    String? state,
  }) =>
      UserAccountModel(
        username: username ?? this.username,
        password: password ?? this.password,
        totalPoints: totalPoints ?? this.totalPoints,
        profileImageLink: profileImageLink ?? this.profileImageLink,
        city: city ?? this.city,
        state: state ?? this.state,
      );

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      UserAccountModel(
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
