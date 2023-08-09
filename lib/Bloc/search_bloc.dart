
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports/REPOSITRY/API/sports_api.dart';
import 'package:sports/REPOSITRY/MODELCLASS/searchmodel.dart';
part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late Searchmodel searchmodel;
  Sportsapi sportsapi = Sportsapi();

  SearchBloc() : super(SearchInitial()) {
    on<Fetchsearch>((event, emit) async {
      emit(SearchLoading());
      try {
        searchmodel = await sportsapi.postsearchmodel(event.message);
        emit(SearchLoaded());
      } catch (e) {
        print(e);
        emit(SearchError());
      }
    });
  }
}

