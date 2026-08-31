import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/movie/domain/repositories/repositories.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie_event.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;
  MovieBloc({required this.repository}) : super(InitState()) {
  
   on<PopularMoviesEvent> ((event, emit) async {

    emit(ProgressMovie());
   
    try {
      final getPopularMovie = await repository.getPopularMovies();

    emit(GetPopularMoviesState(popularMovie: getPopularMovie));

    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }


   });
  }
}