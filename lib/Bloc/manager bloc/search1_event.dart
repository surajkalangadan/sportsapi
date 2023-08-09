part of 'search1_bloc.dart';

@immutable
abstract class Search1Event {}

class Fetchsearch1 extends Search1Event {
  final String message;

  Fetchsearch1({required this.message});
}
