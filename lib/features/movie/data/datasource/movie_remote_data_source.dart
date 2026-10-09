import 'package:movie_verse/features/movie/data/model/genres_movie_model.dart';
import 'package:movie_verse/features/movie/data/model/movie_model.dart';

abstract class MovieRemoteDataSource {
  
  Future<MovieModel> getPopularMovies({required int page});

  Future<MovieModel> getTopRatedMovies({required int page});

  Future<MovieModel> getUpComingMovies ({required int page});

  Future<MovieModel> getAllMovies ({required int page});

  Future<MovieModel> getNewMovie ({required int page});

  Future<MovieModel> getGenreMovie ({required int genre, required int page});

  Future<GenresMovieModel> getMovieGenresItem ();
  
}