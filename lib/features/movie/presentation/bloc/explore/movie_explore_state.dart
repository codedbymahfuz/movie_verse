 import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';

abstract class MovieExploreState {}

 class MovieExploreInitial extends MovieExploreState {}

 class MovieExploreLoading extends MovieExploreState {}

 class MovieExploreLoaded extends MovieExploreState {
  final MovieEntity movieList;
  final bool hasMore;
  final bool isLoadingMore;
  MovieExploreLoaded({
    required this.movieList,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

   MovieExploreLoaded copyWith({
    MovieEntity? movieList,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return MovieExploreLoaded(
      movieList: movieList ?? this.movieList,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

 


 class MovieExploreError extends MovieExploreState {
  final String errorMessage;

  MovieExploreError({required this.errorMessage});
}
 