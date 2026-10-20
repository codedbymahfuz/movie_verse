import 'package:flutter/material.dart';

class AppRoute {
  static Route<T> custom<T>(Widget page) {
    return PageRouteBuilder<T>(
      transitionDuration: const Duration(milliseconds: 450),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (_, _, _) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (context, child) {
            final isPop = animation.status == AnimationStatus.reverse;

            if (isPop) {
              final p = Curves.easeInCubic.transform(1 - animation.value);
              return Opacity(
                opacity: 1 - p,
                child: Transform.translate(
                  offset: Offset(p * MediaQuery.of(context).size.width * 0.3, 0),
                  child: Transform.scale(scale: 1 - 0.08 * p, child: child),
                ),
              );
            }

            final t = Curves.easeOutCubic.transform(animation.value);
            return Opacity(
              opacity: t,
              child: Transform.translate(
                offset: Offset(0, (1 - t) * 60),
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}