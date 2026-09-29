import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class GenreButton extends StatelessWidget {
  const GenreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.midNight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.secondary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(Icons.explore, color: AppColors.warmAmber, size: 20),

          const SizedBox(width: 7),

          Text("Genre", style: TextTheme.of(context).titleMedium),

          const SizedBox(width: 7),

          Icon(
            Icons.arrow_drop_down,
            size: 28,
            color: AppColors.primaryOverlay
          ),
        ],
      ),
    );
  }
}
