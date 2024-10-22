part of 'highlights_bloc.dart';

@immutable
sealed class HighlightsEvent {}
class fetchHighlightsEvent extends HighlightsEvent {
  late final String id;
  fetchHighlightsEvent({required this.id});
}