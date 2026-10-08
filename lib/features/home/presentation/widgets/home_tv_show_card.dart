import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/features/tv_show/domain/entities/tv_show_result_entity.dart';

class HomeTvShowCard extends StatelessWidget {
  final String title;
  final List<TvShowResultEntity> tvShowResults;
  final VoidCallback moreOnPressed;
  final bool ratingShow;

  const HomeTvShowCard({
    super.key,
    required this.title,
    required this.tvShowResults,
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
            itemCount: tvShowResults.length,
            itemBuilder: (context, index) {
              final item = tvShowResults[index];
               
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
                          title: item.name,
                          image: item.backdropPath,
                          overview: item.overview,
                          rating: item.voteAverage ,
                          releaseDate: item.firstAirDate,
                          genresList: item.genreIds,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    child: MediaCard(
                      title: item.name,
                      imageUrl: item.backdropPath,
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