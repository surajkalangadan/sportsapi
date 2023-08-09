

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports/REPOSITRY/MODELCLASS/Search1model.dart';

import '../../REPOSITRY/API/sports_api.dart';

part 'search1_event.dart';
part 'search1_state.dart';

class Search1Bloc extends Bloc<Search1Event, Search1State> {
  late Search1model search1model;
  Sportsapi sportsapi = Sportsapi();

  Search1Bloc() : super(Search1Initial()) {
    on<Fetchsearch1>((event, emit) async {
      emit(Search1Loading());
      try {
        search1model = await sportsapi.postsearch1model(event.message);
        emit(Search1Loaded());
      } catch (e) {
        print(e);
        emit(Search1Error());
      }
    });
  }
}
