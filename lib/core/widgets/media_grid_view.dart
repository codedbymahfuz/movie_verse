import 'package:flutter/material.dart';
import 'package:movie_verse/core/widgets/media_card.dart';

class MediaGridView extends StatelessWidget {
  final bool ratingShow;
  final void Function(int index) onTap;
  const MediaGridView({super.key, required this.onTap, this.ratingShow = true});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;

        if (constraints.maxWidth < 500) {
          crossAxisCount = 2;
        } else if (constraints.maxWidth < 1024) {
          crossAxisCount = 3;
        } else {
          crossAxisCount = 5;
        }

        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: 40,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 15,
            crossAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: MediaCard(ratingShow: ratingShow),
            );
          },
        );
      },
    );
  }
}
