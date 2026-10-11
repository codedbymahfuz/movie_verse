import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_verse/core/constants/movie_api_endpoints.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class EmptyTrailerPlaceholder extends StatelessWidget {
  final String? image;
  const EmptyTrailerPlaceholder({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          if (image != null && image!.isNotEmpty)
            CachedNetworkImage(
              imageUrl: '${TmdbApiEndpoints.imageBaseUrl}$image',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,

              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),

              errorWidget: (_, _, _) => _buildPlaceholder(),
            )
          else
            _buildPlaceholder(),

          Container(color: Colors.black.withValues(alpha: 0.6)),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.movie_outlined, color: AppColors.primary, size: 40),
              const SizedBox(height: 8),
              Text(
                'No trailer available',
                style: TextTheme.of(
                  context,
                ).labelMedium?.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.black87,
      alignment: Alignment.center,
      child: const Icon(Icons.movie, color: AppColors.bgDeep, size: 50),
    );
  }
}
