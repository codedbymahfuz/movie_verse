import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/error_retry_view.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_grid_view.dart';
import 'package:movie_verse/core/widgets/page_header.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_result_entity.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_event.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_state.dart';

class TopRatedTvShowAllScreen extends StatefulWidget {
  const TopRatedTvShowAllScreen({super.key});

  @override
  State<TopRatedTvShowAllScreen> createState() =>
      _TopRatedTvShowAllScreenState();
}

class _TopRatedTvShowAllScreenState extends State<TopRatedTvShowAllScreen> {
  Future<void> _topRatedTvShowPageRefresh() async {
    context.read<TvShowBloc>().add(FetchTopRatedTvShowEvent());
  }

  @override
  void initState() {
    super.initState();
    context.read<TvShowBloc>().add(FetchTopRatedTvShowEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          const PageHeader(title: "Top Rated Tv Show"),

          Expanded(
            child: BlocBuilder<TvShowBloc, TvShowState>(
              builder: (context, state) {
                if (state is TvShowLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is TvShowErrorState) {
                  return ErrorRetryView(
                    onRefresh: _topRatedTvShowPageRefresh,
                    appErrorType: state.errorType,
                  );
                }

                if (state is TvShowLoadedState) {
                  final topRated = state.tvShowList.results;

                  return _topRatedTvShowList(topRated, state, context);
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  MediaGridView<TvShowResultEntity> _topRatedTvShowList(
    List<TvShowResultEntity> topRated,
    TvShowLoadedState state,
    BuildContext context,
  ) {
    return MediaGridView(
      items: topRated,
      isLoadingMore: state.isLoadingMore,
      isHasMore: state.hasMore,
      onLoadMore: () {
        context.read<TvShowBloc>().add(FetchMoreTopRatedTvShowEvent());
      },
      onTap: (item) {
        BottomSheetHelper.show(
          context: context,
          backgroundColor: AppColors.bgDeep,
          child: MediaDetailsBottomSheet(
            id: item.id,
            title: item.name,
            mediaType: 'tv',
            image: item.backdropPath,
            overview: item.overview,
            rating: item.voteAverage,
            releaseDate: item.firstAirDate,
          ),
        );
      },
      itemBuilder: (item) {
        return MediaCard(
          title: item.name,
          imageUrl: item.backdropPath,
          rating: item.voteAverage,
        );
      },
    );
  }
}
