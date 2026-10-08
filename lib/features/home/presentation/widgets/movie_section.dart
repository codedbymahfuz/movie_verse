import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_state.dart';
import 'package:movie_verse/features/home/presentation/widgets/home_movie_card.dart';
import 'package:movie_verse/features/movie/presentation/pages/new_movie_all_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/popular_movie_all_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/top_rated_movie_all_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/up_coming_movie_all_screen.dart';

class MovieSection extends StatelessWidget {
  const MovieSection({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

        if (state is HomeLoadedState) {

          final popular = state.popularMovies.results;
          final newMovie = state.newMovies.results;
          final upComing = state.upComingMovies.results;
          final topRated = state.topRatedMovies.results;

          return Column(
            children: [
             
              HomeMovieCard(
                title: "Popular",
                movieresults: popular,
                moreOnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PopularMovieAllScreen(),
                    ),
                  );
                },
              ),

              HomeMovieCard(
                title: "New",
                movieresults: newMovie,
                moreOnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NewMovieAllScreen(),
                    ),
                  );
                },
              ),


              HomeMovieCard(
                title: "UpComing",
                movieresults: upComing,
                ratingShow: false,

                moreOnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const UpComingMovieAllScreen(),
                    ),
                  );
                },
              ),

              HomeMovieCard(
                title: "Top Rated",
                movieresults: topRated,

                moreOnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TopRatedMovieAllScreen(),
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
