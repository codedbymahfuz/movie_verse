import 'package:movie_verse/features/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_verse/features/movie/domain/repositories/repositories.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<MovieEntity> getPopularMovies({required int page}) async {
    
    return await remoteDataSource.getPopularMovies(page: page);
  }

  @override
  Future<MovieEntity> getTopRatedMovies({required int page}) async {
    return await remoteDataSource.getTopRatedMovies(page: page);
  }

  @override
  Future<MovieEntity> getUpComingMovie({required int page}) async {
    return await remoteDataSource.getUpComingMovies(page: page);
  }

  @override
  Future<MovieEntity> getTrendingAll({required String timeWindow}) async {
    return await remoteDataSource.getTrendingAll(timeWindow: timeWindow);
  }

  @override
  Future<MovieEntity> getUpNewMovie({required int page}) async {
    return await remoteDataSource.getNewMovie(page: page);
  }

  @override
  Future<MovieEntity> getGenreMovie({required int genre, required int page}) async {
    return await remoteDataSource.getGenreMovie(genre: genre, page: page);
  }
}
