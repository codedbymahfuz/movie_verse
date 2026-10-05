import 'package:movie_verse/features/search/domain/entities/search_result_entity.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<SearchResultsEntity> searchResult;

  final bool hasMore;
  final bool isLoadingMore;

  SearchLoadedState({
    required this.searchResult,
    this.hasMore = true,
    this.isLoadingMore = false,
  });
  SearchLoadedState copyWith({
    final List<SearchResultsEntity>? searchResult,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return SearchLoadedState(
      searchResult: searchResult ?? this.searchResult,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState({required this.message});
}
