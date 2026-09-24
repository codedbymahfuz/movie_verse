import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/utils/pagination_util.dart';
import 'package:movie_verse/features/tv_show/domain/repositories/repositories.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show_event.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show_state.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {
  final TvShowRepository repository;

  int popularTvShowPage = 1;
  int topRatedTvShowPage = 1;

  TvShowBloc({required this.repository}) : super(TvShowInitialState()) {
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
        emit(TvShowErrorState(errorMessage: e.toString()));
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
        emit(TvShowErrorState(errorMessage: e.toString()));
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
  }
}
