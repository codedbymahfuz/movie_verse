import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/home/presentation/cubit/trending_tab_cubit.dart';
import 'package:movie_verse/features/home/presentation/widgets/trending_switch_toggle.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/features/home/presentation/widgets/movie_section.dart';
import 'package:movie_verse/features/home/presentation/widgets/tv_show_section.dart';

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
            const SizedBox(height: 12),

            Row(
              children: [
                Text(
                  "Trending",
                  style: TextTheme.of(
                    context,
                  ).titleLarge?.copyWith(fontSize: 20),
                ),

                const SizedBox(width: 16),

                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: TrendingTabSwitchToggle(
                    today: () {
                      context.read<TrendingTabCubit>().switchButtonTrending(0);
                    },
                    weak: () {
                      context.read<TrendingTabCubit>().switchButtonTrending(1);
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            _trendingSlider(),

            MovieSection(),

            Divider(color: Colors.grey.shade600, indent: 6, endIndent: 6),

            TvShowSection(),
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
                    child: MediaDetailsBottomSheet(
                      title: "Spider- Man - $i",
                      overview: "movie.overview",
                      rating: 2.5,
                    ),
                  );
                },
                child: MediaCard(
                  title: "",
                  imageUrl: "",
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
