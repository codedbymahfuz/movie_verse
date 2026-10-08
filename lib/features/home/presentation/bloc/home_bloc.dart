import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/home/domain/entities/trending_result_entity.dart';
import 'package:movie_verse/features/home/domain/repositories/trending_repositories.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_event.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_state.dart';
import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_verse/features/movie/domain/repositories/repositories.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_entity.dart';
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
        final results = await Future.wait([
          trendingRepositories.getTrendingAll(timeWindow: event.timeWindow),
          movieRepository.getPopularMovies(page: 1),
          movieRepository.getUpNewMovie(page: 1),
          movieRepository.getUpComingMovie(page: 1),
          movieRepository.getTopRatedMovies(page: 1),
          tvShowRepository.getPopularTvShow(page: 1),
          tvShowRepository.getTopRatedTvShow(page: 1),
        ]);

        // final popularMovie = await movieRepository.getPopularMovies(page: 1);
        // final newMovie = await movieRepository.getUpNewMovie(page: 1);
        // final upComingMovie = await movieRepository.getUpNewMovie(page: 1);
        // final topRatedMovie = await movieRepository.getUpNewMovie(page: 1);
        // final popularTvShow = await tvShowRepository.getPopularTvShow(page: 1);
        // final topRatedTvShow = await tvShowRepository.getTopRatedTvShow(
        //   page: 1,
        // );

        emit(
          HomeLoadedState(
            trendingList: results[0] as List<TrendingResulstEntity>,
            popularMovies: results[1] as MovieEntity,
            newMovies: results[2] as MovieEntity,
            upComingMovies: results[3] as MovieEntity,
            topRatedMovies: results[4] as MovieEntity,
            popularTvShows: results[5] as TvShowEntity,
            topRatedTvShows: results[6] as TvShowEntity,
          ),
        );
      } catch (e) {
        emit(HomeErrorState(message: e.toString()));
      }
    });

    on<FetchTrendingAllEvent>((event, emit) async {
      if (state is HomeLoadedState) {
        final currentState = state as HomeLoadedState;

        try {
          final trendingList = await trendingRepositories.getTrendingAll(
            timeWindow: event.timeWindow,
          );

          emit(currentState.copyWith(trendingList: trendingList));
        } catch (e) {
          emit(HomeErrorState(message: e.toString()));
        }
      }
    });
  }
}
