import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/error/app_exception.dart';
import 'package:movie_verse/features/movie/domain/repositories/repositories.dart';
import 'package:movie_verse/features/movie/presentation/bloc/genre/movie_genres_event.dart';
import 'package:movie_verse/features/movie/presentation/bloc/genre/movie_genres_state.dart';

class MovieGenresBloc extends Bloc<MovieGenresEvent, MovieGenresItemState> {
  final MovieRepository repository;

  MovieGenresBloc({required this.repository})
    : super(MovieGenresItemInitialState()) {
    on<FetchMovieGenresItemEvent>((event, emit) async {
      emit(MovieGenresItemLoadingState());

      try {
        final movieGenres = await repository.getMovieGenresItem();

       
        emit(MovieGenresItemLoadedState(genres: movieGenres));
      } catch (e) {
        emit(MovieGenresItemErrorState(errorType: mapExceptionToErrorType(e)));
      }
    });
  }
}
