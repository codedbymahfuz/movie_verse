import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/error/app_exception.dart';
import 'package:movie_verse/core/utils/pagination_util.dart';
import 'package:movie_verse/features/movie/domain/repositories/repositories.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_event.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;
  int popularPage = 1;
  int topRatedPage = 1;
  int upcomingPage = 1;
  int newMoviePage = 1;
  int allMoviePage = 1;
  
  MovieBloc({required this.repository}) : super(MovieInitialState()) {
    
    on<FetchPopularMovieEvent>((event, emit) async {
      popularPage = 1;

      emit(MovieLoadingState());

      try {
        final getPopularMovie = await repository.getPopularMovies(
          page: popularPage,
        );

        emit(
          MovieLoadedState(
            movieList: getPopularMovie,
            hasMore: getPopularMovie.results.isNotEmpty,
          ),
        );
      } catch (e) {   
        emit(MovieErrorState(errorType: mapExceptionToErrorType(e)));
      }
    });

    on<FetchMorePopularMovieEvent>((event, emit) async {
      if (state is! MovieLoadedState) return;

      final currentState = state as MovieLoadedState;

      try {
        popularPage++;

        await PaginationUtil.fetchMoreMovies(
          emit: emit,
          currentState: currentState,
          movieFuture: repository.getPopularMovies(page: popularPage),
        );
      } catch (e) {
        popularPage--;
        emit(
          MovieLoadedState(
            movieList: currentState.movieList,
            hasMore: currentState.hasMore,
            isLoadingMore: false,
          ),
        );
      }
    });

    on<FetchTopRatedMovieEvent>((event, emit) async {
      topRatedPage = 1;
      try {
        final topRatedMovie = await repository.getTopRatedMovies(
          page: topRatedPage,
        );

        emit(MovieLoadedState(movieList: topRatedMovie));
      } catch (e) {
         emit(MovieErrorState(errorType: mapExceptionToErrorType(e)));
      }
    });

    on<FetchMoreTopRatedMovieEvent>((event, emit) async {
      if (state is! MovieLoadedState) return;

      final currentState = state as MovieLoadedState;
      try {
        topRatedPage++;
        await PaginationUtil.fetchMoreMovies(
          emit: emit,
          currentState: currentState,
          movieFuture: repository.getTopRatedMovies(page: topRatedPage),
        );
      } catch (e) {
        topRatedPage--;
        emit(
          MovieLoadedState(
            movieList: currentState.movieList,
            hasMore: currentState.hasMore,
            isLoadingMore: false,
          ),
        );
      }
    });

    on<FetchUpComingMovieEvent>((event, emit) async {
      upcomingPage = 1;
      try {
        final upComingMovie = await repository.getUpComingMovies(
          page: upcomingPage,
        );

        emit(MovieLoadedState(movieList: upComingMovie));
      } catch (e) {
        emit(MovieErrorState(errorType: mapExceptionToErrorType(e)));
      }
    });

    on<FetchMoreUpcomingMovieEvent>((event, emit) async {
      if (state is! MovieLoadedState) return;

      final currentState = state as MovieLoadedState;

      try {
        upcomingPage++;

        await PaginationUtil.fetchMoreMovies(
          emit: emit,
          currentState: currentState,
          movieFuture: repository.getUpComingMovies(page: upcomingPage),
        );
      } catch (e) {
        upcomingPage--;
        emit(
          MovieLoadedState(
            movieList: currentState.movieList,
            hasMore: currentState.hasMore,
            isLoadingMore: false,
          ),
        );
      }
    });

    on<FetchNewMovieEvent>((event, emit) async {
      newMoviePage = 1;
      try {
        final newMovieList = await repository.getUpNewMovies(page: newMoviePage);

        emit(MovieLoadedState(movieList: newMovieList));
      } catch (e) {
        emit(MovieErrorState(errorType: mapExceptionToErrorType(e)));
      }
    });

    on<FetchMoreNewMovieEvent>((event, emit) async {
      if (state is! MovieLoadedState) return;

      final currentState = state as MovieLoadedState;

      try {
        newMoviePage++;

        await PaginationUtil.fetchMoreMovies(
          emit: emit,
          currentState: currentState,
          movieFuture: repository.getUpNewMovies(page: newMoviePage),
        );
      } catch (e) {
        newMoviePage--;
        emit(
          MovieLoadedState(
            movieList: currentState.movieList,
            hasMore: currentState.hasMore,
            isLoadingMore: false,
          ),
        );
      }
    });
   
  }
}
