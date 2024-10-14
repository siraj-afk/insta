part of 'highlights_bloc.dart';

@immutable
sealed class HighlightsEvent {}
class fetchHighlightsEvent extends HighlightsEvent {}