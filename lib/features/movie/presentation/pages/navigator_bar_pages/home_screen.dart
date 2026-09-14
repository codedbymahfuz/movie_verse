import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieSection(
              title: "Popular",
              itemCount: 20,
              moreOnPressed: () {
                debugPrint("Click Popular More");
              },
            ),

            MovieSection(
              title: "New",
              itemCount: 20,
              moreOnPressed: () {
                debugPrint("Click New More");
              },
            ),

            MovieSection(
              title: "UpComing",
              itemCount: 20,
              moreOnPressed: () {
                debugPrint("Click UpComing More");
              },
            ),

            MovieSection(
              title: "Top Rated",
              itemCount: 20,
              moreOnPressed: () {
                debugPrint("Click Top Rated More");
              },
            ),
          ],
        ),
      ),
    );
  }
}
