
import 'package:movie_verse/features/search/domain/entities/search_result_entity.dart';


abstract class SearchRepositories {

  Future<List<SearchResultsEntity>> getSearchMulti ({required String query , required int page});
}