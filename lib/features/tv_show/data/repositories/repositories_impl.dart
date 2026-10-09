import 'package:movie_verse/features/movie/domain/entities/genre_movie_entity.dart';
import 'package:movie_verse/features/tv_show/data/datasource/tv_show_remote_data_source.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_entity.dart';
import 'package:movie_verse/features/tv_show/domain/repositories/repositories.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  final TvShowRemoteDataSource remoteDataSource;

  TvShowRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TvShowEntity> getAllTvShow({required int page}) async { // শুধু এই all করছি
    return await remoteDataSource.getAllTvShow(page: page);
  }

  @override
  Future<TvShowEntity> getPopularTvShow({required int page}) async {
    return await remoteDataSource.getPopularTvShow(page: page);
  }

  @override
  Future<TvShowEntity> getTopRatedTvShow({required int page}) async {
    return await remoteDataSource.getTopRatedTvShow(page: page);
  }

  @override
  Future<TvShowEntity> getGenreTvShow({
    required int genre,
    required int page,
  }) async {
    return await remoteDataSource.getGenreTvShow(genre: genre, page: page);
  }

  @override
  Future<GenresTvShowEntity> getGenreTvShowItem() async {
    return await remoteDataSource.getTvShowGenresItem();
  }
}
