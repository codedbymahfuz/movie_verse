import 'package:movie_verse/features/home/data/datasource/trending_remote_data_source.dart';
import 'package:movie_verse/features/home/domain/entities/trending_result_entity.dart';
import 'package:movie_verse/features/home/domain/repositories/trending_repositories.dart';

class TrendingRepoImpl implements TrendingRepositories {
  final TrendingRemoteDataSource remoteDataSource;
  TrendingRepoImpl({required this.remoteDataSource});

  @override
  Future<List<TrendingResulstEntity>> getTrendingAll({
    required String timeWindow,
  }) async {
    final response = await remoteDataSource.getTrendingAll(
      timeWindow: timeWindow,
    );

    final filteredResults = response.results
        .where((t) => t.mediaType == "movie" || t.mediaType == "tv")
        .toList();

    return filteredResults;
  }
}
