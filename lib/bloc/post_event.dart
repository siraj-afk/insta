part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}
class fetchPostEvent extends PostEvent {
  late final String id;
  fetchPostEvent({required this.id});
}