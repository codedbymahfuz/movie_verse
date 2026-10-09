abstract class TvShowEvent {}

class FetchAllTvShowEvent extends TvShowEvent {}

class FetchMoreAllTvShowEvent extends TvShowEvent {}

class FetchPopularTvShowEvent extends TvShowEvent {}

class FetchMorePopularTvShowEvent extends TvShowEvent {}

class FetchTopRatedTvShowEvent extends TvShowEvent {}

class FetchMoreTopRatedTvShowEvent extends TvShowEvent {}

class FetchGenreTvShowEvent extends TvShowEvent {

  final int genre;

  FetchGenreTvShowEvent({required this.genre});
}

class FetchMoreGenreTvShowEvent extends TvShowEvent {

  final int genre;

  FetchMoreGenreTvShowEvent({required this.genre});
}

class FetchTvShowVideoEvent extends TvShowEvent {
  final int videoId;

  FetchTvShowVideoEvent ({required this.videoId});
}