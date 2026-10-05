abstract class MovieExploreEvent {}

class FetchGenreEvent extends MovieExploreEvent {
  final int genre;

  FetchGenreEvent({required this.genre});
}

class FetchMoreGenreEvent extends MovieExploreEvent {
  final int genre;

  FetchMoreGenreEvent({required this.genre});
}
