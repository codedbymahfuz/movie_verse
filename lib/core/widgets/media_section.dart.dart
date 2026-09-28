import 'package:flutter/material.dart';
import 'package:movie_verse/core/widgets/media_card.dart';

class MediaSection extends StatelessWidget {
  final String title;
  final int itemCount;
  final VoidCallback moreOnPressed;
  final void Function(int index) onTap;
  final bool ratingShow;
  const MediaSection({
  super.key, 
  required this.title, 
  required this.itemCount, 
  required this.moreOnPressed,
  this.ratingShow = true, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextTheme.of(context).titleMedium,
            ),

            Spacer(),

            TextButton(
              onPressed: moreOnPressed,
              child: Text(
                "More",
                style: TextTheme.of(context).titleMedium
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

        SizedBox(
          height: 250,      
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 140, 
                   child: GestureDetector(
                    onTap: () => onTap(index),
                    child: MediaCard(
                      ratingShow: ratingShow,
                    ),
                   )
                  ),
              );
            },
          ),
        ),
      ],
    );
  }
}
