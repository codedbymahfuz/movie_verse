import 'package:movie_verse/features/movie/domain/entities/genre_movie_entity.dart';

abstract class TvShowGenresState {}

class TvShowGenresInitialState extends TvShowGenresState {}

class TvShowMovieGenresLoadingState extends TvShowGenresState {}

class TvShowGenresLoadedState extends TvShowGenresState {
  final GenresTvShowEntity genres;

  TvShowGenresLoadedState({required this.genres});
}

class TvShowGenresErrorState extends TvShowGenresState {
  final String errorMessage;

  TvShowGenresErrorState({required this.errorMessage});
}
