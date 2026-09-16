import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class MoviePageHeader extends StatelessWidget {
  final String title;
  const MoviePageHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: AppColors.primary.withValues(alpha: 0.7),
                size: 22,
              ),
            ),
          ),
           Text(
            title,
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.7), 
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.7,
            ),
          ),
        ],
      ),
    );
  }
}
