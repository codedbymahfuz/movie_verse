import 'package:flutter/material.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_grid_view.dart';

class TvShowScreen extends StatelessWidget {
  const TvShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: MovieGridView(
        onTap: (index) {
          debugPrint("Tv Show $index");
        },
      ),
    );
  }
}
