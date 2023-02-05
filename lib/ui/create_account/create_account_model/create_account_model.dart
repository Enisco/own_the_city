// To parse this JSON data, do
//
//     final UserAccountModel = UserAccountModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

UserAccountModel userAccountModelFromJson(String str) =>
    UserAccountModel.fromJson(json.decode(str));

String userAccountModelToJson(UserAccountModel data) =>
    json.encode(data.toJson());

class UserAccountModel extends Equatable {
  UserAccountModel({
    this.username,
    this.password,
    this.totalPoints,
    this.totalToponymsRecorded,
    this.naturalToponymsRecorded,
    this.artificialToponymsRecorded,
    this.profileImageLink,
    this.city,
    this.state,
  });

  String? username;
  String? password;
  int? totalPoints;
  int? totalToponymsRecorded;
  int? naturalToponymsRecorded;
  int? artificialToponymsRecorded;
  String? profileImageLink;
  String? city;
  String? state;

  UserAccountModel copyWith({
    String? username,
    String? password,
    int? totalPoints,
    int? totalToponymsRecorded,
    int? naturalToponymsRecorded,
    int? artificialToponymsRecorded,
    String? profileImageLink,
    String? city,
    String? state,
  }) =>
      UserAccountModel(
        username: username ?? this.username,
        password: password ?? this.password,
        totalPoints: totalPoints ?? this.totalPoints,
        totalToponymsRecorded:
            totalToponymsRecorded ?? this.totalToponymsRecorded,
        naturalToponymsRecorded:
            naturalToponymsRecorded ?? this.naturalToponymsRecorded,
        artificialToponymsRecorded:
            artificialToponymsRecorded ?? this.artificialToponymsRecorded,
        profileImageLink: profileImageLink ?? this.profileImageLink,
        city: city ?? this.city,
        state: state ?? this.state,
      );

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      UserAccountModel(
        username: json["username"],
        password: json["password"],
        totalPoints: json["totalPoints"],
        totalToponymsRecorded: json["totalToponymsRecorded"],
        naturalToponymsRecorded: json["naturalToponymsRecorded"],
        artificialToponymsRecorded: json["artificialToponymsRecorded"],
        profileImageLink: json["profileImageLink"],
        city: json["city"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "totalPoints": totalPoints,
        "totalToponymsRecorded": totalToponymsRecorded,
        "naturalToponymsRecorded": naturalToponymsRecorded,
        "artificialToponymsRecorded": artificialToponymsRecorded,
        "profileImageLink": profileImageLink,
        "city": city,
        "state": state,
      };

  @override
  List<Object?> get props => [
        username,
        password,
        totalPoints,
        totalToponymsRecorded,
        naturalToponymsRecorded,
        artificialToponymsRecorded,
        profileImageLink,
        city,
        state,
      ];
}
