abstract class SearchEvent {}

class FetchSearchEvent extends SearchEvent {
  final String query;

  FetchSearchEvent({required this.query});
}

class FetchMoreSearchEvent extends SearchEvent {}
