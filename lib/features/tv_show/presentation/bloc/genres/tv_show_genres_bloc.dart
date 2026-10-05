import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/tv_show/domain/repositories/repositories.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/genres/tv_show_genres_event.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/genres/tv_show_genres_state.dart';


class TvShowGenresBloc extends Bloc<TvShowGenresEvent, TvShowGenresState>{

  final TvShowRepository repository;

  TvShowGenresBloc({required this.repository}) : super (TvShowGenresInitialState()) {

    on((event, emit) async {

      emit(TvShowMovieGenresLoadingState());

       try {

        final tvShowGenres = await repository.getGenreTvShowItem();

        emit(TvShowGenresLoadedState(genres: tvShowGenres));


       } catch (e) {
        emit(TvShowGenresErrorState(errorMessage: e.toString(),),);
       }

    });
  }
}