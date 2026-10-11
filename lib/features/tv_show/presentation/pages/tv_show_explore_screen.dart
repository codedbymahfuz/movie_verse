import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/cubit/genre_cubit.dart';
import 'package:movie_verse/core/widgets/genre_button.dart';
import 'package:movie_verse/core/widgets/genre_girdview.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_grid_view.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_result_entity.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/genres/tv_show_genres_bloc.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/genres/tv_show_genres_event.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/genres/tv_show_genres_state.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_event.dart';
import 'package:movie_verse/features/tv_show/presentation/bloc/tv_show/tv_show_state.dart';

class TvShowExploreScreen extends StatefulWidget {
  const TvShowExploreScreen({super.key});

  @override
  State<TvShowExploreScreen> createState() => _TvShowExploreScreenState();
}

class _TvShowExploreScreenState extends State<TvShowExploreScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TvShowBloc>().add(FetchAllTvShowEvent());
    context.read<TvShowGenresBloc>().add(FetchTvShowGenresItemEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowBloc, TvShowState>(
      builder: (context, state) {
        if (state is TvShowLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TvShowErrorState) {
          return Center(child: Text("Error - ${state.errorMessage} "));
        }

        if (state is TvShowLoadedState) {
          final tvShowExplore = state.tvShowList.results;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              _genreFilterButton(context),

              const SizedBox(height: 10),

              Expanded(child: _tvShowList(tvShowExplore, state, context)),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _genreFilterButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BottomSheetHelper.show(
          context: context,
          backgroundColor: AppColors.bgDeep,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.8,
            ),
            child: BlocBuilder<TvShowGenresBloc, TvShowGenresItemState>(
              builder: (context, state) {
                if (state is TvShowMovieGenresItemLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is TvShowGenresItemErrorState) {}

                if (state is TvShowGenresItemLoadedState) {
                  final genresList = state.genres.genres;

                  return BlocBuilder<GenreCubit, int?>(
                    builder: (context, selectedGenreId) {
                      return GenreGridView(
                        genreItems: genresList,
                        selectedGenreId: selectedGenreId,
                        itemName: (item) => item.name,
                        itemId: (item) => item.id,

                        onTap: (genreId) {
                          context.read<GenreCubit>().selectGenre(genreId);

                          if (genreId == null) {
                            context.read<TvShowBloc>().add(
                              FetchAllTvShowEvent(),
                            );
                          } else {
                            context.read<TvShowBloc>().add(
                              FetchSelectDiscoverTvShowEvent(genre: genreId),
                            );
                          }

                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        );
      },
      child: const GenreButton(),
    );
  }

  MediaGridView<TvShowResultEntity> _tvShowList(
    List<TvShowResultEntity> tvShowExplore,
    TvShowLoadedState state,
    BuildContext context,
  ) {
    return MediaGridView(
      items: tvShowExplore,
      isLoadingMore: state.isLoadingMore,
      onLoadMore: () {
        final selectedGenreId = context.read<GenreCubit>().state;

        if (selectedGenreId == null) {
          context.read<TvShowBloc>().add(FetchMoreAllTvShowEvent());
        } else {
          context.read<TvShowBloc>().add(
            FetchMoreSelectDiscoverTvShowEvent(genre: selectedGenreId),
          );
        }
      },
      onTap: (item) {
        BottomSheetHelper.show(
          context: context,
          backgroundColor: AppColors.bgDeep,
          child: MediaDetailsBottomSheet(
            id: item.id,
            title: item.name,
            overview: item.overview,
            mediaType: 'tv',
            image: item.backdropPath,
            genresList: item.genreIds,
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
