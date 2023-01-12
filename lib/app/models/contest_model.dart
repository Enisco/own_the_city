// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ContestModel extends Equatable {
  String? contestCoverPictureLink;
  String? contestName;
  String? contestDescription;
  DateTime? startingDayAndTime;
  DateTime? endingDayAndTime;
  int? maxNumber;
  int? costPerVote;
  List? categories = [];
  //
  int? likes;
  String? location;
  String? username;
  String? userProfilePicsLink;
  String? userFullName;
  bool? verified;
  bool? liked;

  ContestModel({
    this.contestCoverPictureLink,
    this.contestName,
    this.contestDescription,
    this.startingDayAndTime,
    this.endingDayAndTime,
    this.maxNumber,
    this.costPerVote,
    this.categories,
    this.likes,
    this.location,
    this.username,
    this.userProfilePicsLink,
    this.userFullName,
    this.verified,
    this.liked,
  });

  ContestModel copyWith({
    coverPictureFile,
    contestCoverPictureLink,
    contestName,
    contestDescription,
    startingDayAndTime,
    endingDayAndTime,
    maxNumber,
    costPerVote,
    categories,
    likes,
    location,
    username,
    userProfilePicsLink,
    userFullName,
    verified,
  }) =>
      ContestModel(
        contestCoverPictureLink:
            contestCoverPictureLink ?? this.contestCoverPictureLink,
        contestName: contestName ?? this.contestName,
        contestDescription: contestDescription ?? this.contestDescription,
        startingDayAndTime: startingDayAndTime ?? this.startingDayAndTime,
        endingDayAndTime: endingDayAndTime ?? this.endingDayAndTime,
        maxNumber: maxNumber ?? this.maxNumber,
        costPerVote: costPerVote ?? this.costPerVote,
        categories: categories ?? this.categories,
      );

  @override
  List<Object?> get props => [
        contestCoverPictureLink,
        contestName,
        contestDescription,
        startingDayAndTime,
        endingDayAndTime,
        maxNumber,
        costPerVote,
        categories,
      ];
}
