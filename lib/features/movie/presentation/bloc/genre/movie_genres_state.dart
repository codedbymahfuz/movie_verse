import 'package:movie_verse/core/error/app_error_type.dart';
import 'package:movie_verse/features/movie/domain/entities/genre/genre_movie_entity.dart';

abstract class MovieGenresItemState {}

class MovieGenresItemInitialState extends MovieGenresItemState {}

class MovieGenresItemLoadingState extends MovieGenresItemState {}

class MovieGenresItemLoadedState extends MovieGenresItemState {
  final GenresTvShowEntity genres;

  MovieGenresItemLoadedState({required this.genres});
}

class MovieGenresItemErrorState extends MovieGenresItemState {
  final AppErrorType errorType;

  MovieGenresItemErrorState({required this.errorType});
}
