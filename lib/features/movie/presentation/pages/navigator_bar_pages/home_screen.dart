import 'package:flutter/material.dart';
import 'package:movie_verse/features/movie/presentation/pages/new_movie_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/popular_movie_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/top_rated_movie_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/up_coming_movie_screen.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_section.dart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieSection(
              title: "Popular",
              itemCount: 20,
              moreOnPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PopularMovieScreen()),
                );
              },
            ),

            MovieSection(
              title: "New",
              itemCount: 20,
              moreOnPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NewMovieScreen()),
                );
              },
            ),

            MovieSection(
              title: "UpComing",
              itemCount: 20,
              ratingShow: false,
              moreOnPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const UpComingMovieScreen(),
                  ),
                );
              },
            ),

            MovieSection(
              title: "Top Rated",
              itemCount: 20,
              moreOnPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TopRatedMovieScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
