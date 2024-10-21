part of 'followers_bloc.dart';

@immutable
sealed class FollowersEvent {}
class fetchFollowersEvent extends FollowersEvent {}