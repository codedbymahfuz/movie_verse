import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/features/home/presentation/pages/home_screen.dart';
import 'package:movie_verse/features/search/presentation/pages/search_screen.dart';

import 'package:movie_verse/features/movie/presentation/pages/movie_explore_screen.dart';
import 'package:movie_verse/features/tv_show/presentation/pages/tv_show_explore_screen.dart';

class BotomNavigationBar extends StatefulWidget {
  const BotomNavigationBar({super.key});

  @override
  State<BotomNavigationBar> createState() => _BotomNavigationBarState();
}

class _BotomNavigationBarState extends State<BotomNavigationBar> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MovieExploreScreen(),
    const TvShowExploreScreen(), 
    const SearchScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      appBar: AppBar(
        backgroundColor: AppColors.bgDeep,
        elevation: 25,
        title: Text(
          "Cine Verse",
          style: TextTheme.of(context).titleLarge?.copyWith(
            color: AppColors.appBarTitleColor,
           ),
        ),
         centerTitle: true,
        ),
        body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),

      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.midNight,

          border: Border.all(
            color: AppColors.borderDark,
          ),
        ),
        child: Row(
          children: [
            _buildNavigationBar(Icons.home, "Home", 0),
            _buildNavigationBar(Icons.movie, "Movie", 1),
            _buildNavigationBar(Icons.tv, "Tv", 2),
            _buildNavigationBar(Icons.search, "Search", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationBar(IconData icon, String label, int index) {
    bool isSelected = currentIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.warmAmber : AppColors.secondary,
            ),
            Text(
              label,
              style: 
              TextTheme.of(context).labelLarge?.copyWith(
                color: isSelected ? AppColors.warmAmber : AppColors.secondary,
              ),            
            ),
          ],
        ),
      ),
    );
  }
}
