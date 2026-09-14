import 'package:flutter/material.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_card.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final int itemCount;
  final VoidCallback moreOnPressed;
  const MovieSection({super.key, required this.title, required this.itemCount, required this.moreOnPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 94),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
            ),

            Spacer(),

            TextButton(
              onPressed: moreOnPressed,
              child: Text(
                "More",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 94),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.7,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(width: 140, child: MovieCard()),
              );
            },
          ),
        ),
      ],
    );
  }
}
