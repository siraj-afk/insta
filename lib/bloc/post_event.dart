part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}
class fetchPostEvent extends PostEvent {}