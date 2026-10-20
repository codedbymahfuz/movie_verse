import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/cubit/network_cubit.dart';
import 'package:movie_verse/core/widgets/error_retry_view.dart';
import 'package:movie_verse/features/home/domain/entities/trending_result_entity.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_event.dart';
import 'package:movie_verse/features/home/presentation/bloc/home_state.dart';
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



  Future<void> _homePageRefresh() async {
    context.read<HomeBloc>().add(FetcHomeEvent());
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetcHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCubit, bool>(
      listener: (context, isConnected){
        if(isConnected) {
          context.read<HomeBloc>().add(FetcHomeEvent());
        }
    }, child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeErrorState) {
            return ErrorRetryView(
              onRefresh: _homePageRefresh,
              appErrorType: state.errorType,
            );
          }

          if (state is HomeLoadedState) {
            final trendingList = state.trendingList;

            return RefreshIndicator(
              onRefresh: _homePageRefresh,
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
                      ],
                    ),

                    const SizedBox(height: 10),

                    _trendingSlider(trendingList),

                    const MovieSection(),

                    Divider(
                      color: Colors.grey.shade600,
                      indent: 6,
                      endIndent: 6,
                    ),

                    const TvShowSection(),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    ),
    
    );
  }

  Widget _trendingSlider(List<TrendingResulstEntity> trendingList) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 300.0,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        autoPlay: true,
      ),

      itemCount: trendingList.length,
      itemBuilder: (context, index, realIndex) {
        final item = trendingList[index];

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
                      id: item.id,
                      title: item.displayTitle,
                      genresList: item.genreIds,
                      overview: item.overview ?? '',
                      image: item.displayPath,
                      rating: item.voteAverage,
                      releaseDate: item.firstAirDate,
                      mediaType: item.mediaType,
                    ),
                  );
                },
                child: MediaCard(
                  title: item.displayTitle,
                  imageUrl: item.displayPath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
