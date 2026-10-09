
import 'package:movie_verse/features/video/data/datasource/video_remote_data_source.dart';
import 'package:movie_verse/features/video/domain/entities/video_results_entity.dart';
import 'package:movie_verse/features/video/domain/repositories/repositories.dart';

class VideoRepoImpl implements VideoRepository {
  final VideoRemoteDataSource remoteDataSource;

  VideoRepoImpl({required this.remoteDataSource});

  @override
  Future<List<VideoResultsEntity>> getTrailerVideo({
    required int videoId,
    required String mediaType,
  }) async {
    final response = await remoteDataSource.getTrailerVideo(
      videoId: videoId,
      mediaType: mediaType,
    );

    final result = response.results
        .where((video) => video.site == "YouTube" && video.type == "Trailer")
        .toList();

    

    return result;
  }
}
