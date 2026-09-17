import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/features/movie/presentation/pages/movie_details_screen.dart';
import 'package:movie_verse/features/movie/presentation/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_grid_view.dart';

class TvShowScreen extends StatelessWidget {
  const TvShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: MovieGridView(
        onTap: (index) {
          BottomSheetHelper.show(
            context: context,
            backgroundColor: AppColors.bgDeep,
            child: MovieDetailsBottomSheet(
              title: "Spider- Man - $index",
              overview: "movie.overview",
              rating: 2.5,
            ),
          );
        },
      ),
    );
  }
}
