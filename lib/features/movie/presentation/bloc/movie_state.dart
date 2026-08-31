import 'package:movie_verse/features/movie/domain/entities/popular_movie_entity.dart';

abstract class MovieState {}

class InitState extends MovieState {}

class ProgressMovie extends MovieState {}

class GetPopularMoviesState extends MovieState {
  final PopularMovieEntity popularMovie;
  GetPopularMoviesState({required this.popularMovie});
}

class ErrorState extends MovieState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
