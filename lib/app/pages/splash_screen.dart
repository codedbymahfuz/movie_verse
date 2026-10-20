import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_verse/app/pages/main_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this);
  }

  void _goHome() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (_, _, _) => const BotomNavigationBar(), 
        transitionsBuilder: (_, a, _, child) =>
            FadeTransition(opacity: a, child: child),
      ),
    );
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Lottie.asset(
            'lib/app/assets/animations/movie_verse_splash.json',
            controller: _c,
            fit: BoxFit.cover,
            onLoaded: (composition) {
              _c.duration = composition.duration;
              _c.forward().whenComplete(_goHome);
            },
          ),

        
          AnimatedBuilder(
            animation: _c,
            builder: (context, _) {
              final v = _c.value;
              final fadeIn = ((v - 0.55) / 0.2).clamp(0.0, 1.0);
              final fadeOut = 1 - ((v - 0.82) / 0.1).clamp(0.0, 1.0);
              return Align(
                alignment: const Alignment(0, 0.1),
                child: Opacity(
                  opacity: fadeIn * fadeOut,
                  child: const Text(
                    'EVERY TRAILER • EVERY DETAIL',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      letterSpacing: 4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}