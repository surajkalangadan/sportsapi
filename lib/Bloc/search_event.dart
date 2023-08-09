part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}
class Fetchsearch extends SearchEvent{
  final String message;
  Fetchsearch({required this.message});
}
