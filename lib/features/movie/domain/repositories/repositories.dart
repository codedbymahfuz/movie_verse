import 'package:movie_verse/features/movie/data/model/genre/genres_movie_model.dart';
import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  
  Future<MovieEntity> getPopularMovies({required int page});

  Future<MovieEntity> getTopRatedMovies({required int page});

  Future<MovieEntity> getUpComingMovies({required int page});

  Future<MovieEntity> getAllMovies({required int page});

  Future<MovieEntity> getUpNewMovies({required int page});

  Future<MovieEntity> getDiscoverMovies ({required int genre, required int page});

  Future<GenresMovieModel> getMovieGenresItem ();

}
