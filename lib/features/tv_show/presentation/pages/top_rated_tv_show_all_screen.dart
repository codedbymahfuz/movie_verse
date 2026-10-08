import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_grid_view.dart';
import 'package:movie_verse/core/widgets/page_header.dart';
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

          PageHeader(title: "Top Rated Tv Show"),

          Expanded(
            child: BlocBuilder<TvShowBloc, TvShowState>(
              builder: (context, state) {
                if (state is TvShowLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is TvShowLoadedState) {
                  final topRated = state.tvShowList.results;

                  return MediaGridView(
                    items: topRated,
                    isLoadingMore: state.isLoadingMore,
                    onLoadMore: () {
                      context.read<TvShowBloc>().add(
                        FetchMoreTopRatedTvShowEvent(),
                      );
                    },
                    onTap: (item) {
                      BottomSheetHelper.show(
                        context: context,
                        backgroundColor: AppColors.bgDeep,
                        child: MediaDetailsBottomSheet(
                          title: item.name,
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

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
