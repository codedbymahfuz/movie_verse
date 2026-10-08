import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class GenreGirdView extends StatelessWidget {
  final String titleGenre;
  final int? selectGenre;
  final int itemCount;
  final void Function(int index) onTap;

  const GenreGirdView({
    super.key,
    required this.titleGenre,
    required this.onTap,
    required this.selectGenre,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Row(
            children: [
              Text(
                "Select Genre",
                style: TextTheme.of(context).titleLarge?.copyWith(fontSize: 24, color: AppColors.coolGray),
              ),
          
              Spacer(),
          
              _previousScreen(context),
            ],
          ),
        ),

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
            itemCount: itemCount,
            itemBuilder: (context, index) {
              final check = selectGenre == index;
              return GestureDetector(
                onTap: () => onTap(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: check ? AppColors.purple : AppColors.midNight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.secondary),
                  ),
                  child: Center(
                    child: Text(
                      titleGenre,
                      style: TextTheme.of(context).titleMedium?.copyWith(
                        color: check ? AppColors.primary : AppColors.coolGray,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
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
          icon: Icon(Icons.cancel_rounded, color: AppColors.coolGray, size: 30),
        ),
      ],
    );
  }
}