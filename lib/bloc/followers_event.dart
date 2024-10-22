part of 'followers_bloc.dart';

@immutable
sealed class FollowersEvent {}
class fetchFollowersEvent extends FollowersEvent {
  late final String id;
  fetchFollowersEvent({required this.id});
}