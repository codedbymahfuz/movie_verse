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
      emit(MovieExploreLoading());

      try {
        final allMovies = await repository.getAllMovies(page: allMoviePage);

        emit(
          MovieExploreLoaded(
            movieList: allMovies,
            hasMore: allMovies.results.isNotEmpty,
          ),
        );
      } catch (e) {
        emit(MovieExploreErrorState(errorMessage: e.toString()));
      }
    });

    on<FetchMoreAllMovieEvent>((event, emit) async {
      if (state is! MovieExploreLoaded) return;

      final currentState = state as MovieExploreLoaded;

      if (currentState.isLoadingMore || !currentState.hasMore) return;

      allMoviePage++;

      try {
        await PaginationUtil.fetchMoreExploreMovie(
          emit: emit,
          currentState: currentState,
          movieFuture: repository.getAllMovies(page: allMoviePage),
        );
      } catch (e) {
        allMoviePage--;

        emit(
          MovieExploreLoaded(
            movieList: currentState.movieList,
            hasMore: currentState.hasMore,
            isLoadingMore: false,
          ),
        );
      }
    });

    on<FetchSelectGenreEvent>((event, emit) async {
      emit(MovieExploreLoading());
      genrePage = 1;

      try {
        final genreMovieList = await repository.getGenreMovie(
          genre: event.genre,
          page: genrePage,
        );

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

    on<FetchMoreSelectGenreEvent>((event, emit) async {
      if (state is! MovieExploreLoaded) return;

      final currentState = state as MovieExploreLoaded;

      if (currentState.isLoadingMore || !currentState.hasMore) return;

      genrePage++;

      try {
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
