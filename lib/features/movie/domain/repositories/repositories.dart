import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';

abstract class MovieRepository {

  Future<MovieEntity> getPopularMovies ();

  Future<MovieEntity> getTopRatedMovies ();

  Future<MovieEntity> getUpComingMovie();
  
  
}