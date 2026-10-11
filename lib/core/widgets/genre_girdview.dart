import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class GenreGridView<T> extends StatelessWidget {
  final List<T> genreItems;
  final int? selectedGenreId;
  final void Function(int? genreId) onTap;
  final String Function(T item) itemName;
  final int Function(T item) itemId;

  const GenreGridView({
    super.key,
    required this.onTap,
    required this.selectedGenreId,
    required this.genreItems,
    required this.itemName,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    final isAllSelected = selectedGenreId == null;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Select Genre",
                  style: TextTheme.of(context).titleLarge?.copyWith(
                    fontSize: 24,
                    color: AppColors.coolGray,
                  ),
                ),

                const Spacer(),

                _previousScreen(context),
              ],
            ),
          ),

          const SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: genreItems.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _allButton(isAllSelected, context);
                }

                final item = genreItems[index - 1];
                final genreId = itemId(item);
                final isSelected = selectedGenreId == genreId;
                
                return GestureDetector(
                  onTap: () => onTap(itemId(item)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.purple : AppColors.midNight,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.secondary),
                    ),
                    child: Center(
                      child: Text(
                        itemName(item),
                        style: TextTheme.of(context).titleMedium?.copyWith(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.coolGray,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _allButton(bool isAllSelected, BuildContext context) {
    return GestureDetector(
                  onTap: () => onTap(null),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isAllSelected
                          ? AppColors.purple
                          : AppColors.midNight,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.secondary),
                    ),
                    child: Center(
                      child: Text(
                        "All",
                        style: TextTheme.of(context).titleMedium?.copyWith(
                          color: isAllSelected
                              ? AppColors.primary
                              : AppColors.coolGray,
                        ),
                      ),
                    ),
                  ),
                );
  }

  Widget _previousScreen(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.cancel_rounded,
            color: AppColors.coolGray,
            size: 30,
          ),
        ),
      ],
    );
  }
}
