abstract class MovieEvent {}

class FetchPopularMovieEvent extends MovieEvent {}

class FetchMorePopularMovieEvent extends MovieEvent {}

class FetchTopRatedMovieEvent extends MovieEvent {}

class FetchMoreTopRatedMovieEvent extends MovieEvent {}

class FetchUpComingMovieEvent extends MovieEvent {}

class FetchMoreUpcomingMovieEvent extends MovieEvent {}

class FetchNewMovieEvent extends MovieEvent {}

class FetchMoreNewMovieEvent extends MovieEvent {}

class TrendingAllEvent extends MovieEvent {
  final String timeWindow;

  TrendingAllEvent({required this.timeWindow});
}
