 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/video/domain/repositories/repositories.dart';
import 'package:movie_verse/features/video/presentation/bloc/video_event.dart';
import 'package:movie_verse/features/video/presentation/bloc/video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState>{

  final VideoRepository repository;

  VideoBloc ({required this.repository}) : super (TrailerVideoInitialState()){

    on<FetchTrailerVideoEvent>((event, emit) async {
      emit(TrailerVideoLoadingState());

      try {
        final video = await repository.getTrailerVideo(videoId: event.videoId, mediaType: event.mediaType);

        emit(TrailerVideoLoadedState(videoResults: video));
      } catch (e) {
        emit(TrailerVideoErrorState(errorMessage: e.toString()));
      }
    });
  }
}