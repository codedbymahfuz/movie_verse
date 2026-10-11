abstract class HomeEvent {}

class FetcHomeEvent extends HomeEvent {}

class FetchTrendingAllEvent extends HomeEvent {
  final String timeWindow;

  FetchTrendingAllEvent({required this.timeWindow});
}
