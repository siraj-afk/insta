part of 'insta_bloc.dart';

@immutable
sealed class InstaState {}

final class InstaInitial extends InstaState {}
class Instablocloading extends InstaState {}
class Instablocloaded extends InstaState {}
class Instablocerror extends InstaState {}