import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class AnimatedMessage extends StatefulWidget {
  final String message;
  final Duration displayDuration;
  final bool isConnected;

  const AnimatedMessage({
    super.key,
    required this.message,
    this.displayDuration = const Duration(seconds: 3),
    this.isConnected = false,
  });

  @override
  State<AnimatedMessage> createState() => _AnimatedMessageState();
}

class _AnimatedMessageState extends State<AnimatedMessage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
      reverseDuration: const Duration(milliseconds: 300),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1.2), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          ),
        );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _showMessage();
  }

  void _showMessage() {
    _hideTimer?.cancel();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _controller.forward();

      _hideTimer = Timer(widget.displayDuration, () {
        if (mounted) {
          _controller.reverse();
        }
      });
    });
  }

  @override
  void didUpdateWidget(covariant AnimatedMessage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.message != widget.message ||
        oldWidget.displayDuration != widget.displayDuration) {
      _showMessage();
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Material(
                color: const Color(0xFF291D25),
                elevation: 8,
                shadowColor: Colors.black38,
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFF7F3548),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF713344),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          widget.isConnected
                              ? Icons.wifi
                              : Icons.wifi_off_rounded,
                          color: const Color(0xFFFF8B9B),
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.isConnected
                                  ? 'Network Connection restored'
                                  : 'Network Connection error',
                              style: TextTheme.of(context).titleMedium
                                  ?.copyWith(
                                    color: widget.isConnected
                                        ? AppColors.warmAmber
                                        : const Color(0xFFFFA0AD),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),

                            const SizedBox(height: 4),
                            Text(
                              widget.message,
                              style: TextTheme.of(context).titleMedium
                                  ?.copyWith(
                                    color: AppColors.primary,
                                    height: 1.4,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
