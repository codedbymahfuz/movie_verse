import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/tv_show/domain/repositories/repositories.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/genres/tv_show_genres_event.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/genres/tv_show_genres_state.dart';


class TvShowGenresBloc extends Bloc<TvShowGenresEvent, TvShowGenresItemState>{

  final TvShowRepository repository;

  TvShowGenresBloc({required this.repository}) : super (TvShowGenresItemInitialState()) {

    on<FetchTvShowGenresItemEvent>((event, emit) async {

      emit(TvShowMovieGenresItemLoadingState());

       try {

        final tvShowGenres = await repository.getGenreTvShowItem();

        emit(TvShowGenresItemLoadedState(genres: tvShowGenres));


       } catch (e) {
        emit(TvShowGenresItemErrorState(errorMessage: e.toString(),),);
       }

    });
  }
}