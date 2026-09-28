import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_grid_view.dart';
import 'package:movie_verse/core/widgets/page_header.dart';

class PopularMovieAllScreen extends StatefulWidget {
  const PopularMovieAllScreen({super.key});

  @override
  State<PopularMovieAllScreen> createState() => _PopularMovieAllScreenState();
}

class _PopularMovieAllScreenState extends State<PopularMovieAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          PageHeader(title: "Popular Movie"),

          Expanded(
            child: MediaGridView(
              onTap: (index) {
                BottomSheetHelper.show(
                  context: context,
                  backgroundColor: Color(0xFF0A0C10),
                  child: MediaDetailsBottomSheet(
                    title: "Spider- Man FJJFGJFGJFGJGFJGJGFFHFHFHFH - $index",
                    overview: "movie.overview ",
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
