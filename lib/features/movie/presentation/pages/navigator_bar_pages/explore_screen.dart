import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_grid_view.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  String? selectedGenre;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _genreItem(
              title: "Sci-Fi",
              seletColor: selectedGenre == "Sci-Fi",
              onTap: () {
                setState(() {
                  selectedGenre = "Sci-Fi";
                });
              },
            ),

            _genreItem(
              title: "Thriller",
              seletColor: selectedGenre == "Thriller",
              onTap: () {
                setState(() {
                  selectedGenre = "Thriller";
                });
              },
            ),

            _genreItem(
              title: "Drama",
              seletColor: selectedGenre == "Drama",
              onTap: () {
                setState(() {
                  selectedGenre = "Drama";
                });
              },
            ),

            _genreItem(
              title: "Action",
              seletColor: selectedGenre == "Action",
              onTap: () {
                setState(() {
                  selectedGenre = "Action";
                });
              },
            ),

            _genreItem(
              title: "Romance",
              seletColor: selectedGenre == "Romance",
              onTap: () {
                setState(() {
                  selectedGenre = "Romance";
                });
              },
            ),

            _genreItem(
              title: "Comedy",
              seletColor: selectedGenre == "Comedy",
              onTap: () {
                setState(() {
                  selectedGenre = "Comedy";
                });
              },
            ),

            _genreItem(
              title: "Horror",
              seletColor: selectedGenre == "Horror",
              onTap: () {
                setState(() {
                  selectedGenre = "Horror";
                });
              },
            ),

            _genreItem(
              title: "Adventure",
              seletColor: selectedGenre == "Adventure",
              onTap: () {
                setState(() {
                  selectedGenre = "Adventure";
                });
              },
            ),

            _genreItem(
              title: "Mystery",
              seletColor: selectedGenre == "Mystery",
              onTap: () {
                setState(() {
                  selectedGenre = "Mystery";
                });
              },
            ),

            _genreItem(
              title: "Animation",
              seletColor: selectedGenre == "Animation",
              onTap: () {
                setState(() {
                  selectedGenre = "Animation";
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: MovieGridView(
            onTap: (index) {
              debugPrint("Explore $index");
            },
          ),
        ),
      ],
    );
  }

  Widget _genreItem({
    required String title,
    required VoidCallback onTap,
    required bool seletColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: seletColor ? AppColors.warmAmber : AppColors.midNight,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColors.secondary),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.primary.withValues(alpha: 0.7),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
