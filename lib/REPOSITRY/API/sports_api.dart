import 'dart:convert';
import 'package:http/http.dart';
import 'package:sports/REPOSITRY/MODELCLASS/Sportsmodel.dart';
import 'package:sports/REPOSITRY/MODELCLASS/searchmodel.dart';
import 'api_claint.dart';

class Sportsapi {
  ApiClient apiClient = ApiClient();

  Future<Sportsmodel> getsportsmodel() async {
    String trendingpath =
        "https://sportscore1.p.rapidapi.com/teams";
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Sportsmodel.fromJson(jsonDecode(response.body));
  }
  Future<Searchmodel> postsearchmodel(String message) async {
    String trendingpath =
        'https://sportscore1.p.rapidapi.com/teams/search?section_id=32&country=Spain&page=1&name=$message&locale=en&is_national=0&sport_id=1';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', body);

    return Searchmodel.fromJson(jsonDecode(response.body));
  }
}

