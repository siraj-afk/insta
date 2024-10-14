part of 'highlights_bloc.dart';

@immutable
sealed class HighlightsState {}

final class HighlightsInitial extends HighlightsState {}
class Highlightsblocloading extends HighlightsState{}
class Highlightsblocloaded extends HighlightsState{}
class Highlightsblocerror extends HighlightsState {}