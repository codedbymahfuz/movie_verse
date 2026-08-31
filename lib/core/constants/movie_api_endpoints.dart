  import 'package:movie_verse/core/utils/api_key.dart';

class MovieApiEndpoints {

  static const String _baseUrl = "https://api.themoviedb.org/3";

  static String apiKey = ApiKey.tmdb; 

  static  String popularMovies ='$_baseUrl/movie/popular';
  
 }
