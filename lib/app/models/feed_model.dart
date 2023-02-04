// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class FeedModel extends Equatable {
  String? feedCoverPictureLink;
  String? feedName;
  String? feedDescription;
  int? upvotes;
  String? username;
  String? userProfilePicsLink;
  bool? upvoted;

  FeedModel({
    this.feedCoverPictureLink,
    this.feedName,
    this.feedDescription,
    this.username,
    this.upvotes,
    this.userProfilePicsLink,
    this.upvoted,
  });

  FeedModel copyWith({
    feedCoverPictureLink,
    feedName,
    feedDescription,
    upvotes,
    username,
    userProfilePicsLink,
    upvoted,
  }) =>
      FeedModel(
        feedCoverPictureLink: feedCoverPictureLink ?? feedCoverPictureLink,
        feedName: feedName ?? feedName,
        feedDescription: feedDescription ?? feedDescription,
        upvotes: upvotes ?? upvotes,
        username: username ?? username,
        userProfilePicsLink: userProfilePicsLink ?? userProfilePicsLink,
        upvoted: upvoted ?? upvoted,
      );

  @override
  List<Object?> get props => [
        feedCoverPictureLink,
        feedName,
        feedDescription,
        upvotes,
        username,
        userProfilePicsLink,
        upvoted,
      ];
}
