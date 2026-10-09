import 'package:movie_verse/core/constants/movie_api_endpoints.dart';
import 'package:movie_verse/core/service/api_service.dart';
import 'package:movie_verse/features/video/data/model/video_model.dart';

class VideoRemoteDataSource {
  Future<VideoModel> getTrailerVideo({
    required int videoId,
    required String mediaType,
  }) async {
    final uri =
        "${TmdbApiEndpoints.videoUri}$mediaType/$videoId/videos?${TmdbApiEndpoints.apiKey}";

    final response = await ApiService.getRequest(uri);


    if (response.isSuccess) {
      return VideoModel.fromjson(response.responsiveData);
    }
    throw Exception(response.errorMessage);
  }
}
