part of 'mnager_bloc.dart';

@immutable
abstract class ManagerState {}

class ManagerInitial extends ManagerState {}
class ManagerLoading extends ManagerState {}
class ManagerLoaded extends ManagerState {}
class ManagerError extends ManagerState{}

