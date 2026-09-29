import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class BottomSheetHelper {
  static void show({
    required BuildContext context,
    required Color backgroundColor,
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 88,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
          side: BorderSide(
          color: AppColors.borderDark, 
           width: 2,
          ),
      ),
      builder: (context) {
        return child;
      },
    );
  }
}
