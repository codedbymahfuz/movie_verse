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
import 'package:movie_verse/features/movie/domain/entities/movie_result_entity.dart';
import 'package:movie_verse/features/movie/presentation/bloc/explore/movie_explore_bloc.dart';
import 'package:movie_verse/features/movie/presentation/bloc/explore/movie_explore_event.dart';
import 'package:movie_verse/features/movie/presentation/bloc/explore/movie_explore_state.dart';
import 'package:movie_verse/features/movie/presentation/bloc/genre/movie_genres_bloc.dart';
import 'package:movie_verse/features/movie/presentation/bloc/genre/movie_genres_event.dart';
import 'package:movie_verse/features/movie/presentation/bloc/genre/movie_genres_state.dart';

class MovieExploreScreen extends StatefulWidget {
  const MovieExploreScreen({super.key});

  @override
  State<MovieExploreScreen> createState() => _MovieExploreScreenState();
}

class _MovieExploreScreenState extends State<MovieExploreScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieExploreBloc>().add(FetchAllMovieEvent());

    context.read<MovieGenresBloc>().add(FetchMovieGenresItemEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieExploreBloc, MovieExploreState>(
      builder: (context, state) {
        if (state is MovieExploreLoading) {
          return const Center(child: CircularProgressIndicator(),);
        }

        if (state is MovieExploreLoaded) {

          final movieExplore = state.movieList.results;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const SizedBox(height: 10),

              _genreFilterButton(context),

              const SizedBox(height: 10),

              _movieList(movieExplore, state, context),

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
                    child: BlocBuilder<MovieGenresBloc, MovieGenresItemState>(
                      builder: (context, genreState) {
                        if (genreState is MovieGenresItemLoadingState) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (genreState is MovieGenresItemErrorState) {
                          return Text("Error - ${genreState.errorMessage}");
                        }

                        if (genreState is MovieGenresItemLoadedState) {
                          final genresList = genreState.genres.genres;

                          return BlocBuilder<GenreCubit, int?>(
                            builder: (context, selectedGenreId) {
                              return GenreGridView(
                                genreItems: genresList,
                                selectedGenreId: selectedGenreId,
                                itemName: (item) => item.name,
                                itemId: (item) => item.id,

                                onTap: (genreId) {
                                  context.read<GenreCubit>().selectGenre(
                                    genreId,
                                  );

                                  if (genreId == null) {
                                    context.read<MovieExploreBloc>().add(
                                      FetchAllMovieEvent(),
                                    );
                                  } else {
                                    context.read<MovieExploreBloc>().add(
                                      FetchSelectDiscoverEvent(genre: genreId),
                                    );
                                  }

                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        }

                        return const Center(child: Text('No genres found'));
                      },
                    ),
                  ),
                );
              },
              child: const GenreButton(),
            );
  }

  Widget _movieList(List<MovieResultEntity> movieExplore, MovieExploreLoaded state, BuildContext context) {
    return Expanded(
              child: MediaGridView(
                items: movieExplore,
                isLoadingMore: state.isLoadingMore,
                onLoadMore: () {
                  final selectedGenreId = context.read<GenreCubit>().state;

                  if (selectedGenreId == null) {
                    context.read<MovieExploreBloc>().add(
                      FetchMoreAllMovieEvent(),
                    );
                  } else {
                    context.read<MovieExploreBloc>().add(
                      FetchMoreSelectDiscoverEvent(genre: selectedGenreId),
                    );
                  }
                },
                onTap: (item) {
                  BottomSheetHelper.show(
                    context: context,
                    backgroundColor: AppColors.bgDeep,
                    child: MediaDetailsBottomSheet(
                      id: item.id,
                      title: item.title,
                      image: item.posterPath,
                      mediaType: 'movie',
                      overview: item.overview,
                      genresList: item.genreIds,
                      rating: item.voteAverage,
                      releaseDate: "",
                    ),
                  );
                },
                itemBuilder: (item) {
                  return MediaCard(
                    title: item.title,
                    imageUrl: item.posterPath,
                    rating: item.voteAverage,
                  );
                },
              ),
            );
  }
}
