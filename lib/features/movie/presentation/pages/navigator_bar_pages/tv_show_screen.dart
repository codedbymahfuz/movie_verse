import 'package:flutter/material.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_card.dart';

class TvShowScreen extends StatelessWidget {
  const TvShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return LayoutBuilder(
      builder: (context, constrains) {
        int crossAxisCount;

        if (constrains.maxWidth < 600) {
          crossAxisCount = 3;
        } else if (constrains.maxWidth < 900) {
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
            return MovieCard();
          },
        );
      },
    );
  }

 
}
