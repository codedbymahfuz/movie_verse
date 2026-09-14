import 'package:flutter/material.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        const SizedBox(height: 10),

        Wrap(
          spacing: 16,
          runSpacing: 10,
          children: [
            _genreItem("Sci-Fi"),

            _genreItem("Thriller"),

            _genreItem("Drama"),

            _genreItem("Action"),

            _genreItem("Romance"),

            _genreItem("Comedy"),

            _genreItem("Horror"),

            _genreItem("Adventure"),

            _genreItem("Mystery"),

            _genreItem("Animation"),

          ],
        ),
           const SizedBox(height: 20),
           Expanded(
          child: LayoutBuilder(
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
          ),
        ),
      ],
    );
  }

  Widget _genreItem(String title) {
    return GestureDetector(
      onTap: () {
        debugPrint("Click $title");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xff15181e),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: const Color(0xff292d35)),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 15),
        ),
      ),
    );
  }
}
