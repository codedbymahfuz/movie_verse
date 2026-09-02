import 'package:movie_verse/features/movie/domain/entities/movie_entity.dart';

 abstract class MovieState {}

 class InitState extends MovieState {}

 class ProgressMovie extends MovieState {}

 class GetMoviesState extends MovieState {
  final MovieEntity movieList;
  GetMoviesState({required this.movieList});
}

 class ErrorState extends MovieState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
 