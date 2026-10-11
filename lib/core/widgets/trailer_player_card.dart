import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_verse/core/constants/movie_api_endpoints.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPlayerCard extends StatefulWidget {
  final String videoKey;
  final String? thumbnailUrl;

  const TrailerPlayerCard({
    super.key,
    required this.videoKey,
    this.thumbnailUrl,
  });

  @override
  State<TrailerPlayerCard> createState() => _TrailerPlayerCardState();
}

class _TrailerPlayerCardState extends State<TrailerPlayerCard> {
  YoutubePlayerController? _controller;
  StreamSubscription<YoutubeVideoState>? _videoStateSubscription;

  bool _isPlaying = false;
  bool _isLoading = false;

  void _playTrailer() {
    if (widget.videoKey.isEmpty) return;

    _controller?.close();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoKey,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    setState(() {
      _isPlaying = true;
      _isLoading = true;
    });

    _videoStateSubscription = _controller?.videoStateStream.listen((state) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _controller?.close();
    _videoStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.thumbnailUrl == null
        ? null
        : '${TmdbApiEndpoints.imageBaseUrl}${widget.thumbnailUrl}';

    if (_isPlaying && _controller != null) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            Positioned.fill(child: YoutubePlayer(controller: _controller!)),

            if (_isLoading) const Center(child: CircularProgressIndicator(),),
          ],
        ),
      );
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GestureDetector(
        onTap: _playTrailer,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            if (imageUrl != null && widget.thumbnailUrl!.isNotEmpty)
              CachedNetworkImage(
                imageUrl: imageUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,

                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),

                errorWidget: (context, _, _) => _buildPlaceholder(),
              )
              
            else
              _buildPlaceholder(),

            Container(color: Colors.black.withValues(alpha: 0.3)),
            const Icon(
              Icons.play_circle_fill,
              color: AppColors.primary,
              size: 64,
            ),
          ],
        ),
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
