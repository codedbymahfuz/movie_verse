import 'package:equatable/equatable.dart';
import 'package:movie_verse/features/home/domain/entities/trending_result_entity.dart';
import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_entity.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<TrendingResulstEntity> trendingList;

  final MovieEntity popularMovies;
  final MovieEntity newMovies;
  final MovieEntity upComingMovies;
  final MovieEntity topRatedMovies;

  final TvShowEntity popularTvShows;
  final TvShowEntity topRatedTvShows;

  HomeLoadedState({
    required this.trendingList,
    required this.popularMovies,
    required this.newMovies,
    required this.upComingMovies,
    required this.topRatedMovies,
    required this.popularTvShows,
    required this.topRatedTvShows,
  });

  HomeLoadedState copyWith({
    final List<TrendingResulstEntity>? trendingList,
    final MovieEntity? popularMovies,
    final MovieEntity? newMovies,
    final MovieEntity? upComingMovies,
    final MovieEntity? topRatedMovies,
    final TvShowEntity? popularTvShows,
    final TvShowEntity? topRatedTvShows,
  }) {
    return HomeLoadedState(
      trendingList: trendingList ?? this.trendingList,
      popularMovies: popularMovies ?? this.popularMovies,
      newMovies: newMovies ?? this.newMovies,
      upComingMovies: upComingMovies ?? this.upComingMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      popularTvShows: popularTvShows ?? this.popularTvShows,
      topRatedTvShows: topRatedTvShows ?? this.topRatedTvShows,
    );
  }

  @override
  List<Object?> get props => [
    //trendingList,
    popularMovies,
    newMovies,
    upComingMovies,
    topRatedMovies,
    popularTvShows,
    topRatedTvShows,
  ];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
