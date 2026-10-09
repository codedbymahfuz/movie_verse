import 'package:movie_verse/features/video/domain/entities/video_results_entity.dart';

abstract class VideoRepository {
  Future<List<VideoResultsEntity>> getTrailerVideo({
    required int videoId,
    required String mediaType,
  });
}
