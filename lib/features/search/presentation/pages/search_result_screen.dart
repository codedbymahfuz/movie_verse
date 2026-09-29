import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/media_grid_view.dart';

class SearchResultScreen extends StatelessWidget {
  final int queryItem;

  const SearchResultScreen({super.key, required this.queryItem});

  @override
  Widget build(BuildContext context) {
    return MediaGridView(
      items: [queryItem],
      onTap: (index) {
        BottomSheetHelper.show(
          context: context,
          backgroundColor: AppColors.bgDeep,
          child: MediaDetailsBottomSheet(
            title: "Spider- Man - $index",
            overview: "movie.overview",
            rating: 2.5,
          ),
        );
      },
      itemBuilder: (item) {
        return MediaCard(title: "", imageUrl: "", rating: 1.0);
      },
    );
  }
}
