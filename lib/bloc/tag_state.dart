part of 'tag_bloc.dart';

@immutable
sealed class TagState {}

final class TagInitial extends TagState {}
class Tagblocloading extends TagState{}
class Tagblocloaded extends TagState{}
class Tagblocerror extends TagState{}