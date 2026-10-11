abstract class TvShowEvent {}

class FetchAllTvShowEvent extends TvShowEvent {}

class FetchMoreAllTvShowEvent extends TvShowEvent {}

class FetchPopularTvShowEvent extends TvShowEvent {}

class FetchMorePopularTvShowEvent extends TvShowEvent {}

class FetchTopRatedTvShowEvent extends TvShowEvent {}

class FetchMoreTopRatedTvShowEvent extends TvShowEvent {}

class FetchSelectDiscoverTvShowEvent extends TvShowEvent {

  final int genre;

  FetchSelectDiscoverTvShowEvent({required this.genre});
}

class FetchMoreSelectDiscoverTvShowEvent extends TvShowEvent {

  final int genre;

  FetchMoreSelectDiscoverTvShowEvent({required this.genre});
}

