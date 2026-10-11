import 'package:movie_verse/features/movie/domain/entities/genre/genre_movie_entity.dart';

abstract class TvShowGenresItemState {}

class TvShowGenresItemInitialState extends TvShowGenresItemState {}

class TvShowMovieGenresItemLoadingState extends TvShowGenresItemState {}

class TvShowGenresItemLoadedState extends TvShowGenresItemState {
  final GenresTvShowEntity genres;

  TvShowGenresItemLoadedState({required this.genres});
}

class TvShowGenresItemErrorState extends TvShowGenresItemState {
  final String errorMessage;

  TvShowGenresItemErrorState({required this.errorMessage});
}
