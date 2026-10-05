import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/home/domain/repositories/trending_repositories.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_event.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_state.dart';
import 'package:movie_verse/features/movie/domain/repositories/repositories.dart';
import 'package:movie_verse/features/tv_show/domain/repositories/repositories.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MovieRepository movieRepository;
  final TvShowRepository tvShowRepository;
  final TrendingRepositories trendingRepositories;

  HomeBloc({
    required this.movieRepository,
    required this.tvShowRepository,
    required this.trendingRepositories,
  }) : super(HomeInitialState()) {

    on<FetcHomeEvent>((event, emit) async {
      emit(HomeLoadingState());

      try {
        final popularMovie = await movieRepository.getPopularMovies(page: 1);
        final newMovie = await movieRepository.getUpNewMovie(page: 1);
        final upComingMovie = await movieRepository.getUpNewMovie(page: 1);
        final topRatedMovie = await movieRepository.getUpNewMovie(page: 1);
        final popularTvShow = await tvShowRepository.getPopularTvShow(page: 1);
        final topRatedTvShow = await tvShowRepository.getTopRatedTvShow(
          page: 1,
        );

        emit(
          HomeLoadedState(
            popularMovies: popularMovie,
            newMovies: newMovie,
            upComingMovies: upComingMovie,
            topRatedMovies: topRatedMovie,
            popularTvShows: popularTvShow,
            topRatedTvShows: topRatedTvShow,
          ),
        );
      } catch (e) {
        emit(HomeErrorState(message: e.toString()));
      }
    });

    on<FetchTrendingAllEvent>((event, emit) async {
      emit(HomeLoadingState());

      try {
        final trendingList = await trendingRepositories.getTrendingAll(
          timeWindow: event.timeWindow,
          
        );

        emit(TrendingLoadedState(trendingList: trendingList));
      } catch (e) {
        emit(HomeErrorState(message: e.toString()));
      }
    });
 
  }
}
