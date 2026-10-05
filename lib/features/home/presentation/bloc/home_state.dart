import 'package:movie_verse/features/home/domain/entities/trending_result_entity.dart';
import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_entity.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final MovieEntity popularMovies;
  final MovieEntity newMovies;
  final MovieEntity upComingMovies;
  final MovieEntity topRatedMovies;

  final TvShowEntity popularTvShows;
  final TvShowEntity topRatedTvShows;

  HomeLoadedState({
    required this.popularMovies,
    required this.newMovies,
    required this.upComingMovies,
    required this.topRatedMovies,
    required this.popularTvShows,
    required this.topRatedTvShows,
  });
}

class TrendingLoadedState extends HomeState {
  final List<TrendingResulstEntity> trendingList;
  TrendingLoadedState({required this.trendingList});
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}
