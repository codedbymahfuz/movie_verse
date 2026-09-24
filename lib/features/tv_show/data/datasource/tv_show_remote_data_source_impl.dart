import 'package:movie_verse/core/constants/movie_api_endpoints.dart';
import 'package:movie_verse/core/service/api_service.dart';
import 'package:movie_verse/features/tv_show/data/datasource/tv_show_remote_data_source.dart';
import 'package:movie_verse/features/tv_show/data/model/tv_show_model.dart';

class TvShowRemoteDataSourceImpl extends TvShowRemoteDataSource {
  @override
  
  Future<TvShowModel> getPopularTvShow({required int page}) async {
    final uri = "${TmdbApiEndpoints.popularTvShow}${TmdbApiEndpoints.apiKey}&page=$page";

    final response = await ApiService.getRequest(uri);

    if (response.isSuccess) {
      
    return TvShowModel.fromJson(response.responsiveData);
    }

    throw Exception("Something Wrong");
  }

  @override
  Future<TvShowModel> getTopRatedTvShow({required int page}) async {
    final uri =
        "${TmdbApiEndpoints.topRaterTvShow}${TmdbApiEndpoints.apiKey}&page=$page";

    final response = await ApiService.getRequest(uri);

    if (response.isSuccess) {
      return TvShowModel.fromJson(response.responsiveData);
    }

    throw Exception("Something Wrong");
  }
}
