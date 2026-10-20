import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/cubit/network_cubit.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/widgets/error_retry_view.dart';
import 'package:movie_verse/features/search/presentation/bloc/search_bloc.dart';
import 'package:movie_verse/features/search/presentation/bloc/search_event.dart';
import 'package:movie_verse/features/search/presentation/bloc/search_state.dart';
import 'package:movie_verse/features/search/presentation/pages/search_result_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String currentQuery = '';

  Future<void> _searchPageRefresh() async {
    final query = currentQuery.trim();

    if (query.isEmpty) return;

    context.read<SearchBloc>().add(FetchSearchEvent(query: query));
  }

  Future<void> _searchNetworkRefresh() async {
    if (currentQuery.trim().isEmpty) return;

    _searchPageRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCubit, bool>(
      listener: (context, isConnected) {
        if (isConnected && currentQuery.trim().isNotEmpty) {
          _searchNetworkRefresh();
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 18),

          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 350),
              child: _searchingBoxText(AppColors.secondary, context, (value) {
                currentQuery = value;
              }),
            ),
          ),

          const SizedBox(height: 30),

          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInitialState) {
                  return Center(
                    child: Text(
                      'Search for movies and TV shows',
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                if (state is SearchLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is SearchErrorState) {
                  return ErrorRetryView(
                    onRefresh: _searchPageRefresh,
                    appErrorType: state.errorType,
                  );
                }

                if (state is SearchLoadedState) {
                  final result = state.searchResult;

                  if (result.isEmpty) {
                    return Center(
                      child: Text(
                        'No Data Found',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: _searchPageRefresh,
                    child: SearchResultScreen(
                      queryItem: result,
                      isLoadingMore: state.isLoadingMore,
                      isHasMore: state.hasMore,
                      searchResultLoadMore: () {
                        context.read<SearchBloc>().add(FetchMoreSearchEvent());
                      },
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchingBoxText(
    Color searchTextColor,
    BuildContext context,

    ValueChanged<String> onQueryChanged,
  ) {
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
                  onQueryChanged(query);

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
