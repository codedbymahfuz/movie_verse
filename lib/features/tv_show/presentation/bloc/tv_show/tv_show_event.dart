abstract class TvShowEvent {}

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
