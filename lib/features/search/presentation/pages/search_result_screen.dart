import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/bottom_sheet_helper.dart';
import 'package:movie_verse/core/widgets/media_card.dart';
import 'package:movie_verse/core/widgets/media_details_screen.dart';
import 'package:movie_verse/core/widgets/media_grid_view.dart';
import 'package:movie_verse/features/search/domain/entities/search_result_entity.dart';

class SearchResultScreen extends StatelessWidget {
  final List<SearchResultsEntity> queryItem;
  final bool isLoadingMore;
  final bool isHasMore;
  final void Function() searchResultLoadMore;

  const SearchResultScreen({super.key, 
  required this.queryItem, required this.searchResultLoadMore,  this.isLoadingMore = false, required this.isHasMore,});

  @override
  Widget build(BuildContext context) {

    return MediaGridView(
      items: queryItem,
      isLoadingMore: isLoadingMore,
      isHasMore: isHasMore,
      onLoadMore: () {
      searchResultLoadMore();
      },
        onTap: (item) {
        BottomSheetHelper.show(
          context: context,
          backgroundColor: AppColors.bgDeep,
          child: MediaDetailsBottomSheet(
            id: item.id,
            title: item.displayTitle ,
            overview: item.overview.toString(),
            image: item.displayPath,
            genresList: item.genreIds,
            rating: item.voteAverage,
            mediaType: item.mediaType,
            releaseDate: item.mediareleaseDate,
          ),
        );
      },
        itemBuilder: (item) {
        return MediaCard(
          title: item.displayTitle, 
          imageUrl: item.displayPath, 
          rating: item.voteAverage,
        );
      },
    );
  }
}
