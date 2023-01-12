// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:equatable/equatable.dart';

class DemoModel extends Equatable {
  File? coverPictureFile;
  String? coverpictureLink;
  String? contestName;
  String? contestDescription;
  DateTime? startingDayAndTime;
  DateTime? endingDayAndTime;
  int? maxNumber;
  int? costPerVote;
  List? categories = [];

  DemoModel({
    this.coverPictureFile,
    this.coverpictureLink,
    this.contestName,
    this.contestDescription,
    this.startingDayAndTime,
    this.endingDayAndTime,
    this.maxNumber,
    this.costPerVote,
    this.categories,
  });

  DemoModel copyWith({
    coverPictureFile,
    coverpictureLink,
    contestName,
    contestDescription,
    startingDayAndTime,
    endingDayAndTime,
    maxNumber,
    costPerVote,
    categories,
  }) =>
      DemoModel(
        coverPictureFile: coverPictureFile ?? this.coverPictureFile,
        coverpictureLink: coverpictureLink ?? this.coverpictureLink,
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
        coverPictureFile,
        coverpictureLink,
        contestName,
        contestDescription,
        startingDayAndTime,
        endingDayAndTime,
        maxNumber,
        costPerVote,
        categories,
      ];
}
