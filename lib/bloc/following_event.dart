part of 'following_bloc.dart';

@immutable
sealed class FollowingEvent {}
class fetchFollowingEvent extends FollowingEvent {}