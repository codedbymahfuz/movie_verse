import 'package:movie_verse/features/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movie_verse/features/movie/data/model/genre/genres_movie_model.dart';
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
  Future<MovieEntity> getUpComingMovies({required int page}) async {
    return await remoteDataSource.getUpComingMovies(page: page);
  }

  @override
  Future<MovieEntity> getAllMovies({required int page}) async {
    return await remoteDataSource.getAllMovies(page: page);
  }

  @override
  Future<MovieEntity> getUpNewMovies({required int page}) async {
    return await remoteDataSource.getNewMovie(page: page);
  }

  @override
  Future<MovieEntity> getDiscoverMovies({
    required int genre,
    required int page,
  }) async {
    return await remoteDataSource.getDiscoverMovies(genre: genre, page: page);
  }

  @override
  Future<GenresMovieModel> getMovieGenresItem() async {
    return await remoteDataSource.getMovieGenresItem();
  }
}
