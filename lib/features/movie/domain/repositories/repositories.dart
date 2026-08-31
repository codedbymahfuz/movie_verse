import 'package:movie_verse/features/movie/domain/entities/popular_movie_entity.dart';

abstract class MovieRepository {

  Future<PopularMovieEntity> getPopularMovies ();
  
}