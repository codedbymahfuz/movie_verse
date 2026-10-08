abstract class HomeEvent {}

class FetcHomeEvent extends HomeEvent {

  final String timeWindow;

   FetcHomeEvent({this.timeWindow = "day"});
}

class FetchTrendingAllEvent extends HomeEvent {
  final String timeWindow;

  FetchTrendingAllEvent({required this.timeWindow});
}
