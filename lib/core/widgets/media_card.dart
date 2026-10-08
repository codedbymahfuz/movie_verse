import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_verse/core/constants/movie_api_endpoints.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class MediaCard extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final double? rating;
  final BoxFit fit;
  final bool titleShow;
  const MediaCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.fit = BoxFit.fitHeight,
    this.titleShow = true,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final image = "${TmdbApiEndpoints.imageBaseUrl}$imageUrl";

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: double.infinity,
                  width: double.infinity,
                  fit: fit,

                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(color: AppColors.purple),
                  ),

                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: AppColors.purple, size: 27),
                      
                ),
              ),

              _ratingText(),
            ],
          ),
        ),

        const SizedBox(height: 5),

        titleShow
            ? Text(
                title,
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
