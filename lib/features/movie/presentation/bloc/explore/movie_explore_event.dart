abstract class MovieExploreEvent {}

class FetchAllMovieEvent extends MovieExploreEvent {}

class FetchMoreAllMovieEvent extends MovieExploreEvent {}

class FetchSelectGenreEvent extends MovieExploreEvent {
  final int genre;

  FetchSelectGenreEvent({required this.genre});
}

class FetchMoreSelectGenreEvent extends MovieExploreEvent {
  final int genre;

  FetchMoreSelectGenreEvent({required this.genre});
}

class FetchDiscoverMovie extends MovieExploreEvent {}

class FetchMoreDiscoverMovie extends MovieExploreEvent {}
