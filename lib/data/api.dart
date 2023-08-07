import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_app/constants/api_key.dart';
import 'package:netflix_app/data/models/search_model.dart';
import 'package:netflix_app/data/models/series_model.dart';
import 'package:netflix_app/data/models/movie_model.dart';
import 'package:netflix_app/data/url.dart';

class Api {
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(
      Uri.parse('${Url.baseUrl}${Url.trending}$apiKey'),
    );
    final decodedResult = jsonDecode(response.body)['results'] as List;
    final movies =
        decodedResult.map((movie) => Movie.fromjason(movie)).toList();
    return movies;
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(
      Uri.parse('${Url.baseUrl}${Url.upComing}$apiKey'),
    );
    final decodedResult = jsonDecode(response.body)['results'] as List;
    final movies =
        decodedResult.map((movie) => Movie.fromjason(movie)).toList();
    return movies;
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(
      Uri.parse('${Url.baseUrl}${Url.topRatedMovies}$apiKey'),
    );
    final decodedResult = jsonDecode(response.body)['results'] as List;
    final movies =
        decodedResult.map((movie) => Movie.fromjason(movie)).toList();
    return movies;
  }

  Future<List<Movie>> getNewReleasedMovies() async {
    final response = await http.get(
      Uri.parse('${Url.baseUrl}${Url.newReleases}$apiKey'),
    );
    final decodedResult = jsonDecode(response.body)['results'] as List;
    final movies =
        decodedResult.map((movie) => Movie.fromjason(movie)).toList();
    return movies;
  }

  Future<List<Series>> getSeries() async {
    final response = await http.get(
      Uri.parse('${Url.baseUrl}${Url.series}$apiKey'),
    );
    final decodedResult = jsonDecode(response.body)['results'] as List;
    final movies =
        decodedResult.map((movie) => Series.fromjason(movie)).toList();
    return movies;
  }

  Future<List<Series>> getAiringTodaySeries() async {
    final response = await http.get(
      Uri.parse('${Url.baseUrl}${Url.seriesAiringToday}$apiKey'),
    );
    final decodedResult = jsonDecode(response.body)['results'] as List;
    // print(decodedResult);
    final movies =
        decodedResult.map((movie) => Series.fromjason(movie)).toList();
    return movies;
  }

  Future<List<Series>> getTopRatedSeries() async {
    final response = await http.get(
      Uri.parse('${Url.baseUrl}${Url.topRatedSeries}$apiKey'),
    );
    final decodedResult = jsonDecode(response.body)['results'] as List;
    // print(decodedResult);
    final movies =
        decodedResult.map((movie) => Series.fromjason(movie)).toList();
    return movies;
  }

  Future<List<SearchModel>> getSearchResults(String name) async {
    final searchurl = Url.search.replaceFirst('{name}', name);

    final response = await http.get(
      Uri.parse('${Url.baseUrl}$searchurl$apiKey'),
    );
    final decodedResult = jsonDecode(response.body)['results'] as List;

    final results = decodedResult
        .map((result) => SearchModel.fromjson(result))
        .toList();

    return results;
  }

  Future<List<SearchModel>> getTreandingMoviesAndSeries() async {
    
    final response = await http.get(
      Uri.parse('${Url.baseUrl}${Url.treandingMoviesAndSeries}$apiKey'),
    );
    final decodedResult = jsonDecode(response.body)['results'] as List;

    final results = decodedResult
        .map((result) => SearchModel.fromjson(result))
        .toList();
        
    return results;
  }

}
