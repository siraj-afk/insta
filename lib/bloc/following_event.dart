part of 'following_bloc.dart';

@immutable
sealed class FollowingEvent {}
class fetchFollowingEvent extends FollowingEvent {
  late final String id;
  fetchFollowingEvent({required this.id});
}