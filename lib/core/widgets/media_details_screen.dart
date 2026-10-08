import 'package:flutter/material.dart';
import 'package:movie_verse/core/helpers/genre_helper.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/media_card.dart';

class MediaDetailsBottomSheet extends StatelessWidget {
  final String title;
  final String? image;
  final List<int>? genresList;
  final String overview;
  final String? releaseDate;
  final double? rating;
  final String? mediaType;
  final BoxFit? fit;

  const MediaDetailsBottomSheet({
    super.key,
    required this.title,
    required this.overview,
    required this.rating,
    this.image,
    this.genresList,
    required this.releaseDate,
    this.mediaType,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    final ratingText = rating != null ? rating!.toStringAsFixed(1) : "";

    bool checkMediaType = mediaType != null ? true : false;
    final currentMedia = mediaType == "movie" ? "Movie" : "Tv";
    
    final DateTime? date = releaseDate?.isNotEmpty == true
        ? DateTime.tryParse(releaseDate!)
        : null;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _previousScreen(context),
        
            const SizedBox(height: 10),


            AspectRatio(aspectRatio: 16/9, 
            child: MediaCard(
                title: title,
                imageUrl: image ?? '',
                titleShow: false,
                fit: BoxFit.fitWidth,
              ),
          ),
        
            // SizedBox(
            //   height: 200,
            //   child: MediaCard(
            //     title: title,
            //     imageUrl: image ?? '',
            //     titleShow: false,
            //     fit: BoxFit.cover,
            //   ),
            // ),
        
            const SizedBox(height: 7),
        
            Text(title, maxLines: 3, style: TextTheme.of(context).titleLarge),
        
            const SizedBox(height: 10),
        
            _movieInfo(context: context, date: date, rating: ratingText),
        
            const SizedBox(height: 15),
        
           
        
            checkMediaType
                ? Text(
                    currentMedia,
                    style: TextTheme.of(context).labelLarge?.copyWith(
                      color: AppColors.primary.withValues(alpha: 0.7),
                    ),
                  )
                : const SizedBox.shrink(),
            checkMediaType ? const SizedBox(height: 15) : const SizedBox.shrink(),
        
            if (genresList != null && genresList!.isNotEmpty)
              if (genresList != null && genresList!.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: GenreHelper.getGenreNames(genresList!).map((
                    genreName,
                  ) {
                    return _genereName(genreName, context);
                  }).toList(),
                ),
        
            const SizedBox(height: 15),
        
            Text(overview, style: TextTheme.of(context).bodyMedium),
          ],
        ),
      ),
    );
  }

  Widget _movieInfo({
    DateTime? date,
    required String rating,
    required BuildContext context,
  }) {
    return Row(
      children: [
        date != null
            ? Text(
                date.year.toString(),
                style: TextTheme.of(context).labelMedium,
              )
            : const SizedBox.shrink(),

        const SizedBox(width: 7),

        Icon(Icons.star, color: AppColors.warmAmber, size: 17),

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
          icon: Icon(Icons.cancel_rounded, color: AppColors.coolGray, size: 30),
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
