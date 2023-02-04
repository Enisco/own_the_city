// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:equatable/equatable.dart';

class DemoModel extends Equatable {
  File? coverPictureFile;
  String? coverpictureLink;
  String? feedName;
  String? feedDescription;
  DateTime? startingDayAndTime;
  DateTime? endingDayAndTime;
  int? maxNumber;
  int? costPerVote;
  List? categories = [];

  DemoModel({
    this.coverPictureFile,
    this.coverpictureLink,
    this.feedName,
    this.feedDescription,
    this.startingDayAndTime,
    this.endingDayAndTime,
    this.maxNumber,
    this.costPerVote,
    this.categories,
  });

  DemoModel copyWith({
    coverPictureFile,
    coverpictureLink,
    feedName,
    feedDescription,
    startingDayAndTime,
    endingDayAndTime,
    maxNumber,
    costPerVote,
    categories,
  }) =>
      DemoModel(
        coverPictureFile: coverPictureFile ?? this.coverPictureFile,
        coverpictureLink: coverpictureLink ?? this.coverpictureLink,
        feedName: feedName ?? this.feedName,
        feedDescription: feedDescription ?? this.feedDescription,
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
        feedName,
        feedDescription,
        startingDayAndTime,
        endingDayAndTime,
        maxNumber,
        costPerVote,
        categories,
      ];
}
