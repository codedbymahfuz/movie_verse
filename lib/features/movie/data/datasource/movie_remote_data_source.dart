import 'package:movie_verse/features/movie/data/model/movie_model.dart';

abstract class MovieRemoteDataSource {
  
  Future<MovieModel> getPopularMovies();

  Future<MovieModel> getTopRatedMovies();

  Future<MovieModel> getUpComingMovies ();
  
}