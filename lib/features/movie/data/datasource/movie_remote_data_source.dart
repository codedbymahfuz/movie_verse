import 'package:movie_verse/features/movie/data/model/movie_model.dart';

abstract class MovieRemoteDataSource {
  
  Future<MovieModel> getPopularMovies({required int page});

  Future<MovieModel> getTopRatedMovies({required int page});

  Future<MovieModel> getUpComingMovies ({required int page});

  Future<MovieModel> getTrendingAll ({required String timeWindow});

  Future<MovieModel> getNewMovie ({required int page});
  
}