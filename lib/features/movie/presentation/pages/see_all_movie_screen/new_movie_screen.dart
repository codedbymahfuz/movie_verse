import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/features/movie/presentation/pages/movie_details_screen.dart';
import 'package:movie_verse/features/movie/presentation/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_grid_view.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_page_header.dart';

class NewMovieScreen extends StatefulWidget {
  const NewMovieScreen({super.key});

  @override
  State<NewMovieScreen> createState() => _NewMovieScreenState();
}

class _NewMovieScreenState extends State<NewMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          MoviePageHeader(title: "Latest Movie"),

          Expanded(
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
          ),
        ],
      ),
    );
  }
}
