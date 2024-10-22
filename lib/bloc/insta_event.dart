part of 'insta_bloc.dart';

@immutable
sealed class InstaEvent {}
class fetchInstaEvent extends InstaEvent {
  late final String id;
  fetchInstaEvent({required this.id});
}