import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/features/movie/presentation/pages/movie_details_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/see_all_movie_screen/new_movie_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/see_all_movie_screen/popular_movie_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/see_all_movie_screen/top_rated_movie_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/see_all_movie_screen/up_coming_movie_screen.dart';
import 'package:movie_verse/features/movie/presentation/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/features/movie/presentation/widgets/movie_card.dart';
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

            const SizedBox(height: 7),

            Text(
              "Trending",
              style: TextTheme.of(context).titleLarge?.copyWith(fontSize: 20),
            ),

            const SizedBox(height: 10),

            _trendingSlider(),

            MovieSection(
              title: "Popular",
              itemCount: 20,
              onTap: (index) {
                BottomSheetHelper.show(
                  context: context,
                  backgroundColor: AppColors.bgDeep,
                  child: MovieDetailsBottomSheet(
                    title: "Spider- Man - $index",
                    overview: "movie.overview",
                    rating: 2.5,
                  ),
                );
              },
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
              onTap: (index) {
                BottomSheetHelper.show(
                  context: context,
                  backgroundColor: AppColors.bgDeep,
                  child: MovieDetailsBottomSheet(
                    title: "Spider- Man - $index",
                    overview: "movie.overview",
                    rating: 2.5,
                  ),
                );
              },
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
              onTap: (index) {
                BottomSheetHelper.show(
                  context: context,
                  backgroundColor: AppColors.bgDeep,
                  child: MovieDetailsBottomSheet(
                    title: "Spider- Man - $index",
                    overview: "movie.overview",
                    rating: 2.5,
                  ),
                );
              },
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
              onTap: (index) {
                BottomSheetHelper.show(
                  context: context,
                  backgroundColor: AppColors.bgDeep,
                  child: MovieDetailsBottomSheet(
                    title: "Spider- Man - $index",
                    overview: "movie.overview",
                    rating: 2.5,
                  ),
                );
              },
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

  Widget _trendingSlider() {
    return CarouselSlider(
      options: CarouselOptions(height: 300.0, autoPlay: true),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  BottomSheetHelper.show(
                    context: context,
                    backgroundColor: AppColors.bgDeep,
                    child: MovieDetailsBottomSheet(
                      title: "Spider- Man - $i",
                      overview: "movie.overview",
                      rating: 2.5,
                    ),
                  );
                },
                child: MovieCard(),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
