import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/text_theme.dart';
import 'package:movie_verse/features/movie/presentation/pages/botom_navigation_bar_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: AppTextTheme.textTheme(), 
         useMaterial3: true,
        ),
         home: BotomNavigationBar(),
    );
  }
}
