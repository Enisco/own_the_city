
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HomepageBlocEvent extends Equatable {}

class ContestClicked extends HomepageBlocEvent {
  @override
  List<Object?> get props => [];
}

class RefreshFeeds extends HomepageBlocEvent {
  BuildContext context;
  double size;

  RefreshFeeds(this.context, this.size);

  @override
  List<Object?> get props => [context, size];
}

class GoToChats extends HomepageBlocEvent {
  @override
  List<Object?> get props => [];
}

class PostLiked extends HomepageBlocEvent {
  @override
  List<Object?> get props => [];
}
