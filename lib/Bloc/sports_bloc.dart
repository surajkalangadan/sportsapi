
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports/REPOSITRY/MODELCLASS/Sportsmodel.dart';
import '../REPOSITRY/API/sports_api.dart';


part 'sports_event.dart';
part 'sports_state.dart';

class SportsBloc extends Bloc<SportsEvent, SportsState> {
  late Sportsmodel sportsmodel;
  Sportsapi sportsapi=Sportsapi();
  SportsBloc() : super(SportsInitial()) {

    on<Fetchsports>((event, emit)async {
      emit(SportsLoading());
      try{

        sportsmodel = await sportsapi.getsportsmodel();
        emit(SportsLoaded());
      } catch(e){
        print(e);
        emit(SportsError());}
    });
}}
