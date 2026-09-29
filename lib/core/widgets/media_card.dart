import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class MediaCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double? rating;
  final bool titleShow;
  const MediaCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.titleShow = true,
    this.rating,
  });

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

              _ratingText(),
            ],
          ),
        ),

        const SizedBox(height: 5),

        titleShow
            ? Text(
                "Movie test",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextTheme.of(context).bodyMedium,
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _ratingText() {
      if (rating == null || rating! <= 0) {
        return const SizedBox.shrink();
      }

      return Positioned(
        bottom: 5,
        left: 8,
        child: _movieRating(rating!.toStringAsFixed(1)),
      );
    }

  Widget _movieRating(String rating) {
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
            rating,
            style: TextStyle(fontSize: 12, color: AppColors.warmAmber),
          ),
        ],
      ),
    );
  }
}
