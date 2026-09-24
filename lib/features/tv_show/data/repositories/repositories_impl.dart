import 'package:movie_verse/features/tv_show/data/datasource/tv_show_remote_data_source.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_entity.dart';
import 'package:movie_verse/features/tv_show/domain/repositories/repositories.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  final TvShowRemoteDataSource remoteDataSource;

  TvShowRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TvShowEntity> getPopularTvShow({required int page}) async {
    return await remoteDataSource.getPopularTvShow(page: page);
  }

  @override
  Future<TvShowEntity> getTopRatedTvShow({required int page}) async {
    return await remoteDataSource.getTopRatedTvShow(page: page);
  }
}
