import 'package:movie_verse/core/constants/movie_api_endpoints.dart';
import 'package:movie_verse/core/service/api_service.dart';
import 'package:movie_verse/features/home/data/model/trending_model.dart';


class TrendingRemoteDataSource {

  Future<TrendingModel> getTrendingAll({required String timeWindow, required}) async {
    final uri =
        "${TmdbApiEndpoints.trendingAll}$timeWindow?${TmdbApiEndpoints.apiKey}";

    final response = await ApiService.getRequest(uri);
    if (response.isSuccess) {
      return TrendingModel.fromJson(response.responsiveData);
    }

    throw Exception("Something Wrong");
  }
}