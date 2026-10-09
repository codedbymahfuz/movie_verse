import 'package:movie_verse/features/video/domain/entities/video_results_entity.dart';

abstract class VideoState {}

class TrailerVideoInitialState extends VideoState {}

class TrailerVideoLoadingState extends VideoState {}

class TrailerVideoLoadedState extends VideoState {

  final List<VideoResultsEntity> videoResults;

  TrailerVideoLoadedState({required this.videoResults});
}

class TrailerVideoErrorState extends VideoState {

  final String errorMessage;

  TrailerVideoErrorState({required this.errorMessage});
}
