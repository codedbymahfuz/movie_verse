import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class AppTextTheme {
  static TextTheme textTheme() {
    return TextTheme(
      
      titleLarge: TextStyle(
        color: AppColors.primary.withValues(alpha: 93),
        fontSize: 25,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),

      titleMedium: TextStyle(
        color: AppColors.primary.withValues(alpha: 94),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.7,
      ),


      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),

       labelMedium: TextStyle(fontSize: 15, color: AppColors.secondary),

      bodyMedium: TextStyle(
        color: AppColors.coolGray,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
    );
  }
}
