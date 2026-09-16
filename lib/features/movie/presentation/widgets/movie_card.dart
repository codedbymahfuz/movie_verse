import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class MovieCard extends StatelessWidget {
  final bool ratingShow;
  const MovieCard({super.key, this.ratingShow = true});

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        "https://images.unsplash.com/photo-1616530940355-351fabd9524b?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              ratingShow
                  ? Positioned(bottom: 5, left: 8, child: _movieRating(),)
                  : const SizedBox.shrink(),
            ],
          ),
        ),

        const SizedBox(height: 5),

        Text(
          "Movie test",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColors.primary.withValues(alpha: 0.7)),
        ),
      ],
    );
  }

  Widget _movieRating() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.midNight,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Icon(Icons.star, color: AppColors.warmAmber, size: 13),
          Text(
            "8.1",
            style: TextStyle(fontSize: 12, color: AppColors.warmAmber),
          ),
        ],
      ),
    );
  }
}
