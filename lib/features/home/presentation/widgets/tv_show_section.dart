import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_state.dart';
import 'package:movie_verse/features/home/presentation/widgets/home_tv_show_card.dart';
import 'package:movie_verse/features/tv_show/presentation/pages/popular_tv_show_all_screen.dart';
import 'package:movie_verse/features/tv_show/presentation/pages/top_rated_tv_show_all_screen.dart';

class TvShowSection extends StatelessWidget {
  const TvShowSection({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

        if (state is HomeLoadedState) {

          final popularTv = state.popularTvShows.results;
          final topRatedTv = state.topRatedTvShows.results;

          return Column(
            children: [

              HomeTvShowCard(
                title: "Popular Tv Show",
                tvShowResults: popularTv,
                moreOnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PopularTvShowAllScreen(),
                    ),
                  );
                },
              ),

              HomeTvShowCard(
                title: "Top Rated Tv Show",
                tvShowResults: topRatedTv,
                moreOnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TopRatedTvShowAllScreen(),
                    ),
                  );
                },
              ),
            ],
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
