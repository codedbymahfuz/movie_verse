import 'package:flutter/material.dart';
import 'package:movie_verse/app/pages/splash_screen.dart';
import 'package:movie_verse/core/helpers/network_message_overlay.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/theme/text_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: AppTextTheme.textTheme(),
        useMaterial3: true,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.purple,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.purple,
            foregroundColor: AppColors.primary,
          ),
        ),
      ),

       builder: (context, child) {
        return NetworkMessageOverlay(
          child: child ?? const SizedBox.shrink(),
        );
      },

      home: const SplashScreen(),
    );
  }
}
