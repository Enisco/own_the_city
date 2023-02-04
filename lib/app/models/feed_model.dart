// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class FeedModel extends Equatable {
  String? feedCoverPictureLink;
  String? feedName;
  String? feedDescription;
  int? thumbsUp;
  String? username;
  String? userProfilePicsLink;
  bool? upvoted;

  FeedModel({
    this.feedCoverPictureLink,
    this.feedName,
    this.feedDescription,
    this.username,
    this.thumbsUp,
    this.userProfilePicsLink,
    this.upvoted,
  });

  FeedModel copyWith({
    feedCoverPictureLink,
    feedName,
    feedDescription,
    thumbsUp,
    username,
    userProfilePicsLink,
    upvoted,
  }) =>
      FeedModel(
        feedCoverPictureLink: feedCoverPictureLink ?? feedCoverPictureLink,
        feedName: feedName ?? feedName,
        feedDescription: feedDescription ?? feedDescription,
        thumbsUp: thumbsUp ?? thumbsUp,
        username: username ?? username,
        userProfilePicsLink: userProfilePicsLink ?? userProfilePicsLink,
        upvoted: upvoted ?? upvoted,
      );

  @override
  List<Object?> get props => [
        feedCoverPictureLink,
        feedName,
        feedDescription,
        thumbsUp,
        username,
        userProfilePicsLink,
        upvoted,
      ];
}
