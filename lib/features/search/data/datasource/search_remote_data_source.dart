import 'package:movie_verse/core/constants/movie_api_endpoints.dart';
import 'package:movie_verse/core/service/api_service.dart';
import 'package:movie_verse/features/search/data/model/search_model.dart';

class SearchRemoteDataSource {
  Future<SearchModel> getSearchMulti(String query, int page) async {
    final uri =
        "${TmdbApiEndpoints.searchMulti}?query=$query&${TmdbApiEndpoints.apiKey}&page=$page";

    final response = await ApiService.getRequest(uri);

    if (response.isSuccess) {
      return SearchModel.fromJson(response.responsiveData);
    }
    throw Exception(response.errorMessage);
  }
}
