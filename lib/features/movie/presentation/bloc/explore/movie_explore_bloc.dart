import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/utils/pagination_util.dart';
import 'package:movie_verse/features/movie/domain/repositories/repositories.dart';
import 'package:movie_verse/features/movie/presentation/bloc/explore/movie_explore_event.dart';
import 'package:movie_verse/features/movie/presentation/bloc/explore/movie_explore_state.dart';


class MovieExploreBloc extends Bloc<MovieExploreEvent, MovieExploreState> {
  final MovieRepository repository;

  int genrePage = 1;
  int allMoviePage = 1;

  MovieExploreBloc({required this.repository}) : super(MovieExploreInitial()) {

    on<FetchAllMovieEvent>((event, emit) async {
      allMoviePage = 1;
      try {
        final allMovies = await repository.getAllMovies(page: allMoviePage);

        emit(MovieExploreLoaded(movieList: allMovies));
      } catch (e) {
        emit(MovieExploreErrorState(errorMessage: e.toString()));
      }
    });

    on<FetchMoreAllMovieEvent>((event, emit) async {
      if (state is! MovieExploreLoaded) return;

      final currentState = state as MovieExploreLoaded;

      try {
        allMoviePage++;

        await PaginationUtil.fetchMoreExploreMovie(
          emit: emit,
          currentState: currentState,
          movieFuture: repository.getAllMovies(page: allMoviePage),
        );
      } catch (e) {
        allMoviePage--;
        emit(MovieExploreLoaded(
          movieList: currentState.movieList, 
          hasMore: currentState.hasMore,
          isLoadingMore: false
          ));
      }
    });

    on<FetchGenreEvent>((event, emit) async {
      emit(MovieExploreLoading());

      try {
        int genrePage = 1;
        final genreMovieList = await repository.getGenreMovie(
          genre: event.genre,
          page: genrePage,
        );

        debugPrint("${genreMovieList.results.length}");

        emit(
          MovieExploreLoaded(
            movieList: genreMovieList,
            hasMore: genreMovieList.results.isNotEmpty,
          ),
        );
      } catch (e) {
        emit(MovieExploreErrorState(errorMessage: e.toString()));
      }
    });

    on<FetchMoreGenreEvent>((event, emit) async {
      if (state is! MovieExploreLoaded) return;

      final currentState = state as MovieExploreLoaded;

      try {
        genrePage++;

        await PaginationUtil.fetchMoreGenreMovies(
          emit: emit,
          currentState: currentState,
          movieFuture: repository.getGenreMovie(
            genre: event.genre,
            page: genrePage,
          ),
        );
      } catch (e) {
        genrePage--;
        emit(
          MovieExploreLoaded(
            movieList: currentState.movieList,
            hasMore: currentState.hasMore,
            isLoadingMore: false,
          ),
        );
      }
    });
 
  }
}
