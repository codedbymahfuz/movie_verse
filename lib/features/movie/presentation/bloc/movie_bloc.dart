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

    emit(GetMoviesState(movieList: getPopularMovie));

    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }


   });

    on<TopRatedMoviesEvent>((event, emit) async {

      try {
      final topRatedMovie = await repository.getTopRatedMovies();

    emit(GetMoviesState(movieList: topRatedMovie));

    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }

    });

    on<UpComingMoviesEvent>((event, emit) async {

      try {
      final upComingMovie = await repository.getUpComingMovie();

    emit(GetMoviesState(movieList: upComingMovie));

    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }

    });
  }
}