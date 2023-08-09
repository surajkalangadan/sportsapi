
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports/REPOSITRY/MODELCLASS/Managermodel.dart';

import '../../REPOSITRY/API/sports_api.dart';

part 'mnager_event.dart';
part 'mnager_state.dart';

class ManagerBloc extends Bloc<MnagerEvent, ManagerState> {
  late Managermodel managermodel;
  Sportsapi sportsapi = Sportsapi();

  ManagerBloc() : super(ManagerInitial()) {
    on<Fetchmanager>((event, emit) async {
      emit(ManagerLoading());
      try {
        managermodel = await sportsapi.getmanagermodel();
        emit(ManagerLoaded());
      } catch (e) {
        print(e);
        emit(ManagerError());
      }
    });
  }
}
