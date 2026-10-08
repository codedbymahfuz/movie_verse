import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/cubit/genre_cubit.dart';
import 'package:movie_verse/core/widgets/genre_button.dart';
import 'package:movie_verse/core/widgets/genre_girdview.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_grid_view.dart';


class TvShowExploreScreen extends StatefulWidget {
  const TvShowExploreScreen({super.key});

  @override
  State<TvShowExploreScreen> createState() => _TvShowExploreScreenState();
}

class _TvShowExploreScreenState extends State<TvShowExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),

        GestureDetector(
          onTap: () {
            BottomSheetHelper.show(
              context: context,
              backgroundColor: AppColors.bgDeep,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.8,
                ),
                child: BlocBuilder<GenreCubit, int?>(
                  builder: (context, state) {
                    return GenreGirdView(
                      titleGenre: 'Mahfuz',
                      selectGenre: state,
                      itemCount: 10,

                      onTap: (index) {
                        context.read<GenreCubit>().selectGenre(index);

                       Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            );
          },
          child: GenreButton(),
        ),

        const SizedBox(height: 10),

        Expanded(
            child: MediaGridView(
               items: [1],
              onTap: (index) {
                BottomSheetHelper.show(
                  context: context,
                  backgroundColor: AppColors.bgDeep,
                  child: MediaDetailsBottomSheet(
                    title: "Spider- Man - $index",
                    overview: "movie.overview",
                    rating: 2.5, releaseDate: '',
                  ),
                );
              },
              itemBuilder: (item) {
                return MediaCard(title: "", imageUrl: "", rating: 1.0);
              },
            ),
          ),
      ],
    );
  }

  
}