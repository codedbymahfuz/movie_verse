import 'package:flutter/material.dart';

class MediaGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final void Function(T item) onTap;
  const MediaGridView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onTap,
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

        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: items.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 15,
            crossAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final item = items[index];

            return GestureDetector(
              onTap: () => onTap(item),
              child: itemBuilder(item),
            );
          },
        );
      },
    );
  }
}
