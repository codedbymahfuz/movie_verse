import 'package:flutter/material.dart';
import 'package:movie_verse/features/movie/presentation/pages/navigator_bar_pages/explore_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/navigator_bar_pages/home_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/navigator_bar_pages/search_screen.dart';
import 'package:movie_verse/features/movie/presentation/pages/navigator_bar_pages/tv_show_screen.dart';

class BotomNavigationBar extends StatefulWidget {
  const BotomNavigationBar({super.key});

  @override
  State<BotomNavigationBar> createState() => _BotomNavigationBarState();
}

class _BotomNavigationBarState extends State<BotomNavigationBar> {
  int currentUndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ExploreScreen(),
    TvShowScreen(),
    SearchScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0C10),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0C10),
        elevation: 5,
        title: Text("Cine Verse",
          style: TextStyle(
            color: Color(0xFFD4A2AE)
          ),
        ),
         centerTitle: true,
        ),
      body: _pages[currentUndex],

      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Color(0xFF0D0F14),

          border: Border.all(color: Color(0xFF1A1D24)),
        ),
        child: Row(
          children: [
            _buildNavigationBar(Icons.home, "Home", 0),
            _buildNavigationBar(Icons.explore, "Explore", 1),
            _buildNavigationBar(Icons.tv, "Tv", 2),
            _buildNavigationBar(Icons.search, "Search", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationBar(IconData icon, String label, int index) {
    bool isSelected = currentUndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentUndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Color(0xFFD4A24E) : Color(0xFF5B6270),
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Color(0xFFD4A24E) : Color(0xFF5B6270),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
