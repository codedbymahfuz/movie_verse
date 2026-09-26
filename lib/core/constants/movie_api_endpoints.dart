  import 'package:movie_verse/core/utils/api_key.dart';

  class TmdbApiEndpoints {

  static const String _baseUrl = "https://api.themoviedb.org/3";

  static String apiKey = ApiKey.tmdb; 

  static  String popularMovies ='$_baseUrl/movie/popular';

  static String topRatedMovies = "$_baseUrl/movie/top_rated";

  static String upcomingMovies = "$_baseUrl/movie/upcoming";

  static String trendingAll = "$_baseUrl/trending/all/"; 

  static String newMovie = "$_baseUrl/movie/now_playing";

  static String popularTvShow = '$_baseUrl/tv/popular';

  static String topRaterTvShow = '$_baseUrl/tv/top_rated';

  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static const String movieGenre = '$_baseUrl/discover/movie?with_genres=';

  static const String tvGenre = '$_baseUrl/discover/tv?with_genres=';
  
 }
