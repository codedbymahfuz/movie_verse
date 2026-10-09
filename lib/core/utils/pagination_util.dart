import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_verse/features/movie/presentation/bloc/explore/movie_explore_state.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_state.dart';
import 'package:movie_verse/features/search/domain/entities/search_result_entity.dart';
import 'package:movie_verse/features/search/presentation/bloc/search_state.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_entity.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_state.dart';

class PaginationUtil {

  static Future<void> fetchMoreMovies({
    required Emitter<MovieState> emit, 
    required MovieLoadedState currentState,
    required Future<MovieEntity> movieFuture,
  }) async {
    if (currentState.isLoadingMore || !currentState.hasMore) {
      return;
    }

    emit(
      MovieLoadedState(
        movieList: currentState.movieList,
        hasMore: currentState.hasMore,
        isLoadingMore: true,
      ),
    );

    final newMovieList = await movieFuture;

    final updatedMovieResult = [
      ...currentState.movieList.results,
      ...newMovieList.results,
    ];

    final updatedMovieList = MovieEntity(results: updatedMovieResult);

    emit(
      MovieLoadedState(
        movieList: updatedMovieList,
        hasMore: newMovieList.results.isNotEmpty,
        isLoadingMore: false,
      ),
    );
  }
  
  static Future<void> fetchMoreExploreMovie({
    required Emitter<MovieExploreState> emit,
    required MovieExploreLoaded currentState,
    required Future<MovieEntity> movieFuture,
  }) async {
    if (currentState.isLoadingMore || !currentState.hasMore) {
      return;
    }

    emit(
      currentState.copyWith(
        isLoadingMore: true,
      ),
    );

    try {
      final newMovieList = await movieFuture;

      final updatedResults = [
        ...currentState.movieList.results,
        ...newMovieList.results,
      ];

      emit(
        currentState.copyWith(
          movieList: MovieEntity(
            results: updatedResults,
          ),
          hasMore: newMovieList.results.isNotEmpty,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(
        currentState.copyWith(
          isLoadingMore: false,
        ),
      );

      rethrow;
    }
  }
  
  static Future<void> fetchMoreTvShow({
    required Emitter<TvShowState> emit,
    required TvShowLoadedState currentState,
    required Future<TvShowEntity> tvShowFuture,
  }) async {
    if (currentState.isLoadingMore || !currentState.hasMore) {
      return;
    }

    emit(
      TvShowLoadedState(
        tvShowList: currentState.tvShowList,
        hasMore: currentState.hasMore,
        isLoadingMore: true,
      ),
    );

    final tvShowList = await tvShowFuture;

    final updatedTbShowResult = [
      ...currentState.tvShowList.results,
      ...tvShowList.results,
    ];

    final updatedList = TvShowEntity(results: updatedTbShowResult);

    emit(
      TvShowLoadedState(
        tvShowList: updatedList,
        hasMore: tvShowList.results.isNotEmpty,
        isLoadingMore: false,
      ),
    );
  }

  static Future<void> fetchMoreGenreMovies({
    required Emitter<MovieExploreState> emit,
    required MovieExploreLoaded currentState,
    required Future<MovieEntity> movieFuture,
  }) async {
    if (currentState.isLoadingMore || !currentState.hasMore) {
      return;
    }

    emit(
      MovieExploreLoaded(
        movieList: currentState.movieList,
        hasMore: currentState.hasMore,
        isLoadingMore: true,
      ),
    );

    final newMovieList = await movieFuture;

    final updatedMovieResult = [
      ...currentState.movieList.results,
      ...newMovieList.results,
    ];

    final updatedMovieList = MovieEntity(results: updatedMovieResult);

    emit(
      MovieExploreLoaded(
        movieList: updatedMovieList,
        hasMore: newMovieList.results.isNotEmpty,
        isLoadingMore: false,
      ),
    );
  }

  static Future<void> fetchMoreSearchResults({
    required Emitter<SearchState> emit,
    required SearchLoadedState currentState,
    required Future<List<SearchResultsEntity>> results,
  }) async {
    
    if (currentState.isLoadingMore || !currentState.hasMore) {
      return;
    }

    emit(
      SearchLoadedState(
      searchResult: currentState.searchResult,
      hasMore: currentState.hasMore,
      isLoadingMore: true,
      ),
    );

    final newResult = await results;

    final updateList = [...currentState.searchResult, ...newResult];

    emit(
      SearchLoadedState(
        searchResult: updateList,
        hasMore: newResult.isNotEmpty,
        isLoadingMore: false,
      ),
    );
  }

   
}
