import 'package:movie_verse/features/video/data/model/video_results_model.dart';
import 'package:movie_verse/features/video/domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  VideoModel({required super.results});

  factory VideoModel.fromjson(Map<String, dynamic> json) {
    return VideoModel(
      results: (json["results"] as List)
          .map((v) => VideoResultsModel.fromjson(v))
          .toList(),
    );
  }
}
