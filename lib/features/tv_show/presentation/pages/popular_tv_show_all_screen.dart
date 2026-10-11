import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_grid_view.dart';
import 'package:movie_verse/core/widgets/page_header.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_result_entity.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_event.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_state.dart';

class PopularTvShowAllScreen extends StatefulWidget {
  const PopularTvShowAllScreen({super.key});

  @override
  State<PopularTvShowAllScreen> createState() => _PopularTvShowAllScreenState();
}

class _PopularTvShowAllScreenState extends State<PopularTvShowAllScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TvShowBloc>().add(FetchPopularTvShowEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          const PageHeader(title: "Popular Tv Show"),

          Expanded(
            child: BlocBuilder<TvShowBloc, TvShowState>(
              builder: (context, state) {
                if (state is TvShowLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is TvShowLoadedState) {
                  final popular = state.tvShowList.results;

                  return _popularTvShowList(popular, state, context);
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  MediaGridView<TvShowResultEntity> _popularTvShowList(
    List<TvShowResultEntity> popular,
    TvShowLoadedState state,
    BuildContext context,
  ) {
    return MediaGridView(
      items: popular,
      isLoadingMore: state.isLoadingMore,
      onLoadMore: () {
        context.read<TvShowBloc>().add(FetchMorePopularTvShowEvent());
      },
      onTap: (item) {
        BottomSheetHelper.show(
          context: context,
          backgroundColor: AppColors.bgDeep,
          child: MediaDetailsBottomSheet(
            id: item.id,
            title: item.name,
            image: item.backdropPath,
            mediaType: 'tv',
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
