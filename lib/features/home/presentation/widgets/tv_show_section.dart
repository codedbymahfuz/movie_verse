import 'package:flutter/material.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_section.dart.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/features/tv_show/presentation/pages/popular_tv_show_all_screen.dart';
import 'package:movie_verse/features/tv_show/presentation/pages/top_rated_tv_show_all_screen.dart';

class TvShowSection extends StatelessWidget {
  const TvShowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MediaSection(
          title: "Popular Tv Show",
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
              MaterialPageRoute(builder: (_) => const PopularTvShowAllScreen()),
            );
          },
        ),

        MediaSection(
          title: "Top Rated Tv Show",
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
              MaterialPageRoute(
                builder: (_) => const TopRatedTvShowAllScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
