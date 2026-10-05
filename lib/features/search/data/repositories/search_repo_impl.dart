import 'package:movie_verse/features/search/data/datasource/search_remote_data_source.dart';
import 'package:movie_verse/features/search/domain/entities/search_result_entity.dart';
import 'package:movie_verse/features/search/domain/repositories/search_repositories.dart';

class SearchRepoImpl implements SearchRepositories {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepoImpl({required this.remoteDataSource});
  @override
  Future<List<SearchResultsEntity>> getSearchMulti({
    required String query,
    required int page,
  }) async {
    final response = await remoteDataSource.getSearchMulti(query, page);

    final filteredResults = response.results
        .where((s) => s.mediaType == "movie" || s.mediaType == "tv")
        .toList();

    return filteredResults;
  }
}
