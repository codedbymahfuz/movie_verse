import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_grid_view.dart';
import 'package:movie_verse/core/widgets/page_header.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_event.dart';
import 'package:movie_verse/features/movie/presentation/bloc/movie/movie_state.dart';

class UpComingMovieAllScreen extends StatefulWidget {
  const UpComingMovieAllScreen({super.key});

  @override
  State<UpComingMovieAllScreen> createState() => _UpComingMovieAllScreenState();
}

class _UpComingMovieAllScreenState extends State<UpComingMovieAllScreen> {

  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(FetchUpComingMovieEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          PageHeader(title: "UpComing Movie"),

          Expanded(
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state){

               if(state is MovieLoadingState) {
                 return Center(
                  child: CircularProgressIndicator(),
                 );
               }

                if(state is MovieLoadedState) {

                final upComingList = state.movieList.results;

              return MediaGridView(
              items: upComingList,
              isLoadingMore: state.isLoadingMore,
              onLoadMore: () {
                context.read<MovieBloc>().add(FetchMoreUpcomingMovieEvent());
              },
              onTap: (item) {
                BottomSheetHelper.show(
                  context: context,
                  backgroundColor: AppColors.bgDeep,
                  child: MediaDetailsBottomSheet(
                    title: item.title,
                    image: item.posterPath,
                    overview: item.overview,
                    rating: item.voteAverage,
                    releaseDate: item.releaseDate,
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

               return const SizedBox.shrink();

            })
          ),
          
        ],
      ),
    );
  }
}
