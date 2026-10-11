abstract class MovieExploreEvent {}

class FetchAllMovieEvent extends MovieExploreEvent {}

class FetchMoreAllMovieEvent extends MovieExploreEvent {}

class FetchSelectDiscoverEvent extends MovieExploreEvent {
  final int genre;

  FetchSelectDiscoverEvent({required this.genre});
}

class FetchMoreSelectDiscoverEvent extends MovieExploreEvent {
  final int genre;

  FetchMoreSelectDiscoverEvent({required this.genre});
}


