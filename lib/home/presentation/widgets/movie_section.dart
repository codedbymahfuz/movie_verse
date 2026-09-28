import 'package:flutter/material.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_section.dart.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/features/movie/presentation/pages/new_movie_all_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/popular_movie_all_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/top_rated_movie_all_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/up_coming_movie_all_screen.dart';

class MovieSection extends StatelessWidget {
  const MovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MediaSection(
          title: "Popular",
          itemCount: 20,
          onTap: (index) {
            BottomSheetHelper.show(
              context: context,
              backgroundColor: AppColors.bgDeep,
              child: MediaDetailsBottomSheet(
                title: "Spider- Man - $index",
                overview: "movie.overview",
                rating: 2.5,
              ),
            );
          },
          moreOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PopularMovieAllScreen()),
            );
          },
        ),

        MediaSection(
          title: "New",
          itemCount: 20,
          onTap: (index) {
            BottomSheetHelper.show(
              context: context,
              backgroundColor: AppColors.bgDeep,
              child: MediaDetailsBottomSheet(
                title: "Spider- Man - $index",
                overview: "movie.overview",
                rating: 2.5,
              ),
            );
          },
          moreOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NewMovieAllScreen()),
            );
          },
        ),

        MediaSection(
          title: "UpComing",
          itemCount: 20,
          ratingShow: false,
          onTap: (index) {
            BottomSheetHelper.show(
              context: context,
              backgroundColor: AppColors.bgDeep,
              child: MediaDetailsBottomSheet(
                title: "Spider- Man - $index",
                overview: "movie.overview",
                rating: 2.5,
              ),
            );
          },
          moreOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const UpComingMovieAllScreen()),
            );
          },
        ),

        MediaSection(
          title: "Top Rated",
          itemCount: 20,
          onTap: (index) {
            BottomSheetHelper.show(
              context: context,
              backgroundColor: AppColors.bgDeep,
              child: MediaDetailsBottomSheet(
                title: "Spider- Man - $index",
                overview: "movie.overview",
                rating: 2.5,
              ),
            );
          },
          moreOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TopRatedMovieAllScreen()),
            );
          },
        ),
      ],
    );
  }
}
