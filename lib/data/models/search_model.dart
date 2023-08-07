import 'package:netflix_app/data/models/movie_model.dart';
import 'package:netflix_app/data/models/series_model.dart';

class SearchModel {
  Movie? movie;
  Series? series;
  SearchModel({this.movie, this.series});

 
  factory SearchModel.fromjson(Map json) {
    return SearchModel(
        movie: json['media_type'] == 'movie'
            ? Movie(
                title: json['title'],
                overview: json['overview'],
                posterpath: json['poster_path'],
                popularity: json['popularity'],
                coverImage: json['backdrop_path'] ?? '',
                releaseDate: json['release_date'],
              )
            : null,
        series: json['media_type'] == 'tv'
            ? Series(
                name: json['name'] ?? 'nll',
                posterImage: json['poster_path'],
                overview: json['overview'],
                coverImage: json['backdrop_path'],
                popularity: json['popularity'],
                firstAirDate: json['first_air_date'],
              )
            : null);
  }

  
}
