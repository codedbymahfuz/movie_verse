import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/utils/pagination_util.dart';
import 'package:movie_verse/features/search/domain/repositories/search_repositories.dart';
import 'package:movie_verse/features/search/presentation/bloc/search_event.dart';
import 'package:movie_verse/features/search/presentation/bloc/search_state.dart';
import 'package:movie_verse/features/search/presentation/utils/event_transformers.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepositories repositories;

  int _currentPage = 1;

  String currentQuery = '';

  SearchBloc({required this.repositories}) : super(SearchInitialState()) {
    on<FetchSearchEvent>(
      _onFetchSearch,
      transformer: debounce(Duration(milliseconds: 500)),
    );

    on<FetchMoreSearchEvent>(_onFetchMoreSearch, transformer: restartable());
  }

  Future<void> _onFetchSearch(
    FetchSearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      currentQuery = '';
      emit(SearchInitialState());

      return;
    }

    _currentPage = 1;

    currentQuery = query;

    emit(SearchLoadingState());

    try {
      final searchResult = await repositories.getSearchMulti(
        query: event.query,
        page: _currentPage,
      );

      emit(
        SearchLoadedState(
          searchResult: searchResult,
          hasMore: searchResult.isNotEmpty,
        ),
      );
    } catch (e) {
      emit(SearchErrorState(message: e.toString()));
    }
  }

  Future<void> _onFetchMoreSearch(
    FetchMoreSearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (state is! SearchLoadedState) return;

    final currentState = state as SearchLoadedState;

    emit(currentState.copyWith(isLoadingMore: true));

    _currentPage++;

    try {
      await PaginationUtil.fetchMoreSearchResults(
        emit: emit,
        currentState: currentState,
        results: repositories.getSearchMulti(
          query: currentQuery,
          page: _currentPage,
        ),
      );
    } catch (e) {
      _currentPage--;

      emit(
        SearchLoadedState(
          searchResult: currentState.searchResult,
          hasMore: currentState.hasMore,
          isLoadingMore: false,
        ),
      );
    }
  }
}
