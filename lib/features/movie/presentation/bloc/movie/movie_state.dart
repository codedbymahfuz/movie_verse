import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';

abstract class MovieState {}

 class MovieInitialState extends MovieState {}

 class MovieLoadingState extends MovieState {}

 class MovieLoadedState extends MovieState {
  final MovieEntity movieList;
  final bool hasMore;
  final bool isLoadingMore;
  MovieLoadedState({
    required this.movieList,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  MovieLoadedState copyWith({
    MovieEntity? movieList,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return MovieLoadedState(
      movieList: movieList ?? this.movieList,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

 class TrendingAllState extends MovieState {
  final MovieEntity movieList;
  final bool hasMore;
  final bool isLoadingMore;
  TrendingAllState({
    required this.movieList,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

}

 class MovieErrorState extends MovieState {
  final String errorMessage;

  MovieErrorState({required this.errorMessage});
}
 