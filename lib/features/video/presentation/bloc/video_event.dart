abstract class VideoEvent {}

 class FetchTrailerVideoEvent extends VideoEvent {
   final int videoId;
   final String mediaType;

   FetchTrailerVideoEvent({required this.mediaType, required this.videoId});
 }