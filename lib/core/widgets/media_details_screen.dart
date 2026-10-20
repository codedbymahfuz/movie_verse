import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/helpers/genre_helper.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/empty_trailer_placeholder.dart';
import 'package:movie_verse/core/widgets/trailer_player_card.dart';
import 'package:movie_verse/features/video/presentation/bloc/video_bloc.dart';
import 'package:movie_verse/features/video/presentation/bloc/video_event.dart';
import 'package:movie_verse/features/video/presentation/bloc/video_state.dart';

class MediaDetailsBottomSheet extends StatefulWidget {
  final String title;
  final String? image;
  final List<int>? genresList;
  final String overview;
  final String? releaseDate;
  final double? rating;
  final String? mediaType;
  final int id;
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
    required this.id,
    this.fit,
  });

  @override
  State<MediaDetailsBottomSheet> createState() =>
      _MediaDetailsBottomSheetState();
}

class _MediaDetailsBottomSheetState extends State<MediaDetailsBottomSheet> {
  @override
  void initState() {
    super.initState();

    context.read<VideoBloc>().add(
      FetchTrailerVideoEvent(
        mediaType: widget.mediaType.toString(),
        videoId: widget.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ratingText = widget.rating != null
        ? widget.rating!.toStringAsFixed(1)
        : "";

    bool checkMediaType = widget.mediaType != null ? true : false;
    final currentMedia = widget.mediaType == "movie" ? "Movie" : "Tv";

    final DateTime? date = widget.releaseDate?.isNotEmpty == true
        ? DateTime.tryParse(widget.releaseDate!)
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

            _videoPlay(),

            const SizedBox(height: 7),

            Text(
              widget.title,
              maxLines: 3,
              style: TextTheme.of(context).titleLarge,
            ),

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
            checkMediaType
                ? const SizedBox(height: 15)
                : const SizedBox.shrink(),

              if (widget.genresList != null && widget.genresList!.isNotEmpty)
                _genresInfo(context),

            const SizedBox(height: 15),

            Text(widget.overview, style: TextTheme.of(context).bodyMedium),
          ],
        ),
      ),
    );
  }

  BlocBuilder<VideoBloc, VideoState> _videoPlay() {
    return BlocBuilder<VideoBloc, VideoState>(
            builder: (context, state) {
              if (state is TrailerVideoLoadingState) {}
              if (state is TrailerVideoLoadedState) {
                final videos = state.videoResults;

                if (videos.isEmpty) {
                  return EmptyTrailerPlaceholder(image: widget.image);
                }

                final trailer = videos.first;

                return TrailerPlayerCard(
                  videoKey: trailer.key!,
                  thumbnailUrl: widget.image,
                );
              }

              return const SizedBox.shrink();
            },
          );
  }

  Wrap _genresInfo(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: GenreHelper.getGenreNames(widget.genresList!).map((genreName) {
        return _genereName(genreName, context);
      }).toList(),
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

        const Icon(Icons.star, color: AppColors.warmAmber, size: 17),

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
          icon: const Icon(Icons.cancel_rounded, color: AppColors.coolGray, size: 30),
        ),
      ],
    );
  }

  Widget _genereName(String name, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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
