import 'package:movie_verse/features/movie/domain/entities/genre_movie_entity.dart';

abstract class MovieGenresState {}

class MovieGenresInitialState extends MovieGenresState {}

class MovieGenresLoadingState extends MovieGenresState {}

class MovieGenresLoadedState extends MovieGenresState {
  final GenresTvShowEntity genres;

  MovieGenresLoadedState({required this.genres});
}

class MovieGenresErrorState extends MovieGenresState {
  final String errorMessage;

  MovieGenresErrorState({required this.errorMessage});
}
