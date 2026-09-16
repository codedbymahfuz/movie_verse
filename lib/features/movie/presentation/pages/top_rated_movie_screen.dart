import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_grid_view.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_page_header.dart';

class TopRatedMovieScreen extends StatelessWidget {
  const TopRatedMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          MoviePageHeader(title: "Top Rated Movie"),

          Expanded(
            child: MovieGridView(
              onTap: (index) {
                debugPrint("Top Rated movie $index");
              },
            ),
          ),
        ],
      ),
    );
  }
}
