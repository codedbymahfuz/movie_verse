import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_card.dart';

class MovieDetailsBottomSheet extends StatelessWidget {
  final String title;
  final String overview;
  final double rating;

  const MovieDetailsBottomSheet({
    super.key,
    required this.title,
    required this.overview,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _previousScreen(context),

          const SizedBox(height: 10),

          SizedBox(
            height: 200,
            child: MovieCard(ratingShow: false, movieNameShow: false),
          ),

          const SizedBox(height: 7),

          Text(title, maxLines: 3, style: TextTheme.of(context).titleLarge),

          const SizedBox(height: 10),

          _movieInfo(context: context, year: "2026", rating: rating.toString()),

          const SizedBox(height: 15),

          _genereName("MySelf", context),

          const SizedBox(height: 15),

          Text(overview, style: TextTheme.of(context).bodyMedium),
        ],
      ),
    );
  }

  Widget _movieInfo({
    required String year,
    required String rating,
    required BuildContext context,
  }) {
    return Row(
      children: [
        Text(year, style: TextTheme.of(context).labelMedium),

        const SizedBox(width: 7),

        Icon(
          Icons.star, 
          color: AppColors.warmAmber, 
          size: 17,
        ),

        const SizedBox(width: 5),

        Text(
          rating,
          style: TextTheme.of(
            context,
          ).labelMedium?.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _previousScreen(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.cancel_rounded, color: AppColors.primary, size: 30),
        ),
      ],
    );
  }

  Widget _genereName(String name, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.midNight,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: AppColors.secondary),
      ),
      child: Text(
        name,
        style: TextTheme.of(
          context,
        ).labelLarge?.copyWith(color: AppColors.primary.withValues(alpha: 0.7)),
      ),
    );
  }
}
