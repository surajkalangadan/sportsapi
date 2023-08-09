part of 'sports_bloc.dart';

@immutable
abstract class SportsState {}

class SportsInitial extends SportsState {}
class SportsLoading extends SportsState {}
class SportsLoaded extends SportsState {}
class SportsError extends SportsState{}

