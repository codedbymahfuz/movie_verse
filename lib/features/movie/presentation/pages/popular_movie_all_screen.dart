import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/error_retry_view.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_grid_view.dart';
import 'package:movie_verse/core/widgets/page_header.dart';
import 'package:movie_verse/features/movie/domain/entities/movie_result_entity.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_event.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_state.dart';

class PopularMovieAllScreen extends StatefulWidget {
  const PopularMovieAllScreen({super.key});

  @override
  State<PopularMovieAllScreen> createState() => _PopularMovieAllScreenState();
}

class _PopularMovieAllScreenState extends State<PopularMovieAllScreen> {

  Future<void> _popularMoviePageRefresh() async {
    context.read<MovieBloc>().add(FetchPopularMovieEvent());
  }

  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(FetchPopularMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          const PageHeader(title: "Popular Movie"),

          Expanded(
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                if (state is MovieErrorState) {
                  return ErrorRetryView(
                    onRefresh: _popularMoviePageRefresh,
                    appErrorType: state.errorType,
                  );
                }

                if (state is MovieLoadedState) {
                  final movies = state.movieList.results;
                  return _popularMovieList(movies, state, context);
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  MediaGridView<MovieResultEntity> _popularMovieList(
    List<MovieResultEntity> movies,
    MovieLoadedState state,
    BuildContext context,
  ) {
    return MediaGridView(
      items: movies,
      isLoadingMore: state.isLoadingMore,
      isHasMore: state.hasMore,
      onLoadMore: () {
        context.read<MovieBloc>().add(FetchMorePopularMovieEvent());
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
            rating: item.voteAverage,
            releaseDate: item.releaseDate,
            genresList: item.genreIds,
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
    );
  }
}
