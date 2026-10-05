import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/movie/domain/repositories/repositories.dart';
import 'package:movie_verse/features/movie/presentation/bloc/genre/movie_genres_event.dart';
import 'package:movie_verse/features/movie/presentation/bloc/genre/movie_genres_state.dart';

class MovieGenresBloc extends Bloc<MovieGenresEvent, MovieGenresState> {
  final MovieRepository repository;

  MovieGenresBloc({required this.repository})
    : super(MovieGenresInitialState()) {
    on((event, emit) async {
      emit(MovieGenresLoadingState());

      try {
        final movieGenres = await repository.getGenresMovieItem();

        emit(MovieGenresLoadedState(genres: movieGenres));
      } catch (e) {
        emit(MovieGenresErrorState(errorMessage: e.toString()));
      }
    });
  }
}
