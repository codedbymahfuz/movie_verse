import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  
  Future<MovieEntity> getPopularMovies({required int page});

  Future<MovieEntity> getTopRatedMovies({required int page});

  Future<MovieEntity> getUpComingMovie({required int page});

  Future<MovieEntity> getTrendingAll({required String timeWindow});

 Future<MovieEntity> getUpNewMovie({required int page});
}
