part of 'tag_bloc.dart';

@immutable
sealed class TagEvent {}
class fetchTagEvent extends TagEvent {
  late final String id;
  fetchTagEvent({required this.id});
}