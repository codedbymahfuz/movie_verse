import 'package:movie_verse/core/error/app_error_type.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_entity.dart';

abstract class TvShowState {}

class TvShowInitialState extends TvShowState {}

class TvShowLoadingState extends TvShowState {}

class TvShowLoadedState extends TvShowState {
  final TvShowEntity tvShowList;
  final bool hasMore;
  final bool isLoadingMore;
  TvShowLoadedState({
    required this.tvShowList,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  TvShowLoadedState copyWith({
    TvShowEntity? tvShowList,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return TvShowLoadedState(
      tvShowList: tvShowList ?? this.tvShowList,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class TvShowErrorState extends TvShowState {
  final AppErrorType errorType;

  TvShowErrorState({required this.errorType});
}
