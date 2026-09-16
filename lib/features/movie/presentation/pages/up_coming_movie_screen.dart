import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_grid_view.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_page_header.dart';

class UpComingMovieScreen extends StatelessWidget {
  const UpComingMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          MoviePageHeader(title: "UpComing Movie"),

          Expanded(
            child: MovieGridView(
              ratingShow: false,
              onTap: (index) {
                debugPrint("UpComing movie $index");
              },
            ),
          ),
        ],
      ),
    );
  }
}
