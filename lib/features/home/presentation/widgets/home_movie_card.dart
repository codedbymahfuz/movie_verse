import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/features/movie/domain/entities/movie_result_entity.dart';

class HomeMovieCard extends StatelessWidget {
  final String title;
  final List<MovieResultEntity> movieresults;
  final VoidCallback moreOnPressed;
  final bool ratingShow;

  const HomeMovieCard({
    super.key,
    required this.title,
    required this.movieresults,
    required this.moreOnPressed,
    this.ratingShow = true,
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title, style: TextTheme.of(context).titleMedium),

            Spacer(),

            TextButton(
              onPressed: moreOnPressed,
              child: Text("More", style: TextTheme.of(context).titleMedium),
            ),
          ],
        ),
        const SizedBox(height: 5),

        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieresults.length,
            itemBuilder: (context, index) {
              final item = movieresults[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 140,
                  child: GestureDetector(
                    onTap: () {
                      BottomSheetHelper.show(
                        context: context,
                        backgroundColor: AppColors.bgDeep,
                        child: MediaDetailsBottomSheet(
                          title: item.title,
                          image: item.posterPath,
                          overview: item.overview,
                          rating: item.voteAverage,
                          releaseDate: item.releaseDate,
                          genresList: item.genreIds,
                        ),
                      );
                    },
                    child: MediaCard(
                      title: item.title,
                      imageUrl: item.posterPath,
                      rating: item.voteAverage,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
