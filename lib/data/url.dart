class Url {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String trending = '/trending/movie/day?';
  static const String treandingMoviesAndSeries='/trending/all/day?';
  static const String popularMovies = '/movie/popular?';
  static const String newReleases='/movie/now_playing?';
  static const String popularSeries = '/tv/popular?';
  static const String topRatedMovies = '/movie/top_rated?';
  static const String topRatedSeries = '/tv/top_rated?';
  static const String upComing = '/movie/upcoming?';
  static const String series='/trending/tv/day?';
  static const String seriesAiringToday='/tv/airing_today?';
 
  static const String imageBaseUrl='https://image.tmdb.org/t/p/w500';
  static const String search='/search/multi?query={name}&';
}
