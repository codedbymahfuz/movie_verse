import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class MediaGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final void Function(T item) onTap;
  final VoidCallback? onLoadMore;
  final bool isLoadingMore;
  const MediaGridView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onTap,
    this.onLoadMore,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;

        if (constraints.maxWidth < 500) {
          crossAxisCount = 2;
        } else if (constraints.maxWidth < 1024) {
          crossAxisCount = 3;
        } else {
          crossAxisCount = 5;
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (isLoadingMore || onLoadMore == null) return false;

            if (notification.metrics.pixels >=
                notification.metrics.maxScrollExtent - 30) {
              onLoadMore!();
            }

            return false;
          },
          
           child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: isLoadingMore
                ? items.length + crossAxisCount
                : items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              childAspectRatio: 0.65,
            ),

             itemBuilder: (context, index) {
              if (index >= items.length) {
                return _buildDefaultShimmerItem();
              }
              final item = items[index];

              return GestureDetector(
                onTap: () => onTap(item),
                child: itemBuilder(item),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildDefaultShimmerItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
