import 'package:movie_verse/features/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_verse/features/movie/domain/repositories/repositories.dart';

class MovieRepositoryImpl implements MovieRepository{
  final MovieRemoteDataSource remoteDataSource;

   MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<MovieEntity> getPopularMovies() async {
   
   return await remoteDataSource.getPopularMovies();
  }

  @override
  Future<MovieEntity> getTopRatedMovies() async {

   return await remoteDataSource.getTopRatedMovies();
   
  }

  @override
  Future<MovieEntity> getUpComingMovie() async {
    return await remoteDataSource.getUpComingMovies();
  }
}