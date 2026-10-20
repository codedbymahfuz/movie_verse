import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/error/app_exception.dart';
import 'package:movie_verse/core/utils/pagination_util.dart';
import 'package:movie_verse/features/tv_show/domain/repositories/repositories.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_event.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_state.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {
  final TvShowRepository repository;
  int popularTvShowPage = 1;
  int topRatedTvShowPage = 1;
  int genreTvShowPage = 1;
  int allTvShowPage = 1;

  TvShowBloc({required this.repository}) : super(TvShowInitialState()) {

    on<FetchAllTvShowEvent>((event, emit) async {
      allTvShowPage = 1;

      emit(TvShowLoadingState());

      try {
        final allTvShow = await repository.getAllTvShow(page: allTvShowPage);

        emit(TvShowLoadedState(tvShowList: allTvShow));
      } catch (e) {
       
        emit(TvShowErrorState(errorType: mapExceptionToErrorType(e)));
      }
    });

    on<FetchMoreAllTvShowEvent>((event, emit) async {
      if (state is! TvShowLoadedState) return;

      final currentState = state as TvShowLoadedState;

      try {
        allTvShowPage++;

        await PaginationUtil.fetchMoreTvShow(
          emit: emit,
          currentState: currentState,

          tvShowFuture: repository.getAllTvShow(page: allTvShowPage),
        );
      } catch (e) {
        allTvShowPage--;

        emit(
          TvShowLoadedState(
            tvShowList: currentState.tvShowList,
            hasMore: currentState.hasMore,
            isLoadingMore: false,
          ),
        );
      }
    });

    on<FetchPopularTvShowEvent>((event, emit) async {
      popularTvShowPage = 1;

      emit(TvShowLoadingState());

      try {
        final tvShow = await repository.getPopularTvShow(
          page: popularTvShowPage,
        );

        emit(
          TvShowLoadedState(
            tvShowList: tvShow,
            hasMore: tvShow.results.isNotEmpty,
          ),
        );
      } catch (e) {
        emit(TvShowErrorState(errorType: mapExceptionToErrorType(e)));
      }
    });

    on<FetchMorePopularTvShowEvent>((event, emit) async {
      if (state is! TvShowLoadedState) return;

      final currentState = state as TvShowLoadedState;

      try {
        popularTvShowPage++;

        await PaginationUtil.fetchMoreTvShow(
          emit: emit,
          currentState: currentState,
          tvShowFuture: repository.getPopularTvShow(page: popularTvShowPage),
        );
      } catch (e) {
        popularTvShowPage--;
        emit(
          TvShowLoadedState(
            tvShowList: currentState.tvShowList,
            hasMore: currentState.hasMore,
            isLoadingMore: false,
          ),
        );
      }
    });

    on<FetchTopRatedTvShowEvent>((event, emit) async {
      topRatedTvShowPage = 1;
      emit(TvShowLoadingState());

      try {
        final tvShow = await repository.getTopRatedTvShow(
          page: topRatedTvShowPage,
        );

        emit(
          TvShowLoadedState(
            tvShowList: tvShow,
            hasMore: tvShow.results.isNotEmpty,
          ),
        );
      } catch (e) {
       emit(TvShowErrorState(errorType: mapExceptionToErrorType(e)));
      }
    });

    on<FetchMoreTopRatedTvShowEvent>((event, emit) async {
      if (state is! TvShowLoadedState) return;

      final currentState = state as TvShowLoadedState;

      try {
        topRatedTvShowPage++;

        await PaginationUtil.fetchMoreTvShow(
          emit: emit,
          currentState: currentState,
          tvShowFuture: repository.getTopRatedTvShow(page: topRatedTvShowPage),
        );
      } catch (e) {
        topRatedTvShowPage--;
        emit(
          TvShowLoadedState(
            tvShowList: currentState.tvShowList,
            hasMore: currentState.hasMore,
            isLoadingMore: false,
          ),
        );
      }
    });

    on<FetchSelectDiscoverTvShowEvent>((event, emit) async {
      emit(TvShowLoadingState());

      genreTvShowPage = 1;

      try {
        final genreTvShowList = await repository.getDiscoverTvShow(
          genre: event.genre,
          page: genreTvShowPage,
        );

        emit(
          TvShowLoadedState(
            tvShowList: genreTvShowList,
            hasMore: genreTvShowList.results.isNotEmpty,
          ),
        );
      } catch (e) {
       emit(TvShowErrorState(errorType: mapExceptionToErrorType(e)));
      }
    });

    on<FetchMoreSelectDiscoverTvShowEvent>((event, emit) async {
      if (state is! TvShowLoadedState) return;

      final currentState = state as TvShowLoadedState;

      try {
        genreTvShowPage++;

        await PaginationUtil.fetchMoreTvShow(
          emit: emit,
          currentState: currentState,
          tvShowFuture: repository.getDiscoverTvShow(
            genre: event.genre,
            page: genreTvShowPage,
          ),
        );
      } catch (e) {
        genreTvShowPage--;

        emit(
          TvShowLoadedState(
            tvShowList: currentState.tvShowList,
            hasMore: currentState.hasMore,
            isLoadingMore: false,
          ),
        );
      }
    });

  }
}
