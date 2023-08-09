part of 'search1_bloc.dart';

@immutable
abstract class Search1State {}

class Search1Initial extends Search1State {}
class Search1Loading extends Search1State {}
class Search1Loaded extends Search1State {}
class Search1Error extends Search1State{}
