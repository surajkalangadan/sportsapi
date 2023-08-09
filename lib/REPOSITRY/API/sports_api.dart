import 'dart:convert';
import 'package:http/http.dart';
import 'package:sports/REPOSITRY/MODELCLASS/Managermodel.dart';
import 'package:sports/REPOSITRY/MODELCLASS/Search1model.dart';
import 'package:sports/REPOSITRY/MODELCLASS/Sportsmodel.dart';
import 'package:sports/REPOSITRY/MODELCLASS/searchmodel.dart';
import '../../ui/screen2.dart';
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
  Future<Managermodel> getmanagermodel() async {
    String trendingpath =
        'https://sportscore1.p.rapidapi.com/managers?page=1';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET1', body);

    return Managermodel.fromJson(jsonDecode(response.body));
  }
  Future<Search1model> postsearch1model(String message) async {
    String trendingpath =
        'https://sportscore1.p.rapidapi.com/managers/search?page=1&name=$message&nationality_code=ESP&locale=en';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'POST1', body);

    return Search1model.fromJson(jsonDecode(response.body));
  }
}

