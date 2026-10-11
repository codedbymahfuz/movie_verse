import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/features/search/presentation/bloc/search_bloc.dart';
import 'package:movie_verse/features/search/presentation/bloc/search_event.dart';
import 'package:movie_verse/features/search/presentation/bloc/search_state.dart';
import 'package:movie_verse/features/search/presentation/pages/search_result_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 18),

        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: _searchingBoxText(AppColors.secondary, context),
          ),
        ),

        const SizedBox(height: 30),

        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchInitialState) {
                return Center(
                  child: Text(
                    "Search for movies and TV shows",
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (state is SearchLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is SearchErrorState) {
                return Center(child: Text(state.message));
              }

              if (state is SearchLoadedState) {
                final result = state.searchResult;

                if (result.isEmpty) {
                  return Center(
                    child: Text(
                      "No Data Found",
                      style: TextTheme.of(context).labelMedium,
                    ),
                  );
                }

                return SearchResultScreen(
                  queryItem: result,
                  isLoadingMore: state.isLoadingMore,
                  searchResultLoadMore: () {
                    context.read<SearchBloc>().add(FetchMoreSearchEvent());
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }

  Widget _searchingBoxText(Color searchTextColor, BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.midNight,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.secondary),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Icon(Icons.search, color: searchTextColor),

            const SizedBox(width: 10),

            Expanded(
              child: TextField(
                cursorColor: searchTextColor,
                onChanged: (query) {
                  context.read<SearchBloc>().add(
                    FetchSearchEvent(query: query),
                  );
                },
                style: TextStyle(color: searchTextColor),
                decoration: InputDecoration(
                  hintText: "Search movie and tv series...",
                  hintStyle: TextTheme.of(context).labelMedium,
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
