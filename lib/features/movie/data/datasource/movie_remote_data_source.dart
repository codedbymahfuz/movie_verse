import 'package:movie_verse/features/movie/data/model/popular_movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<PopularMovieModel> getPopularMovies();
}