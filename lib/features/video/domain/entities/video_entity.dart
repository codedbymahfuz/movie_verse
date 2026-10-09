
import 'package:movie_verse/features/video/domain/entities/video_results_entity.dart';

class VideoEntity {
  int? id;
  List<VideoResultsEntity> results;

  VideoEntity({this.id, required this.results});
}
