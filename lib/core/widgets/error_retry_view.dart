import 'package:flutter/material.dart';
import 'package:movie_verse/core/error/app_error_type.dart';

class ErrorRetryView extends StatelessWidget {
  final AppErrorType appErrorType;
  final Future<void> Function() onRefresh;

  const ErrorRetryView({
    super.key,
    required this.onRefresh,
    required this.appErrorType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.22),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(currentIcon(), size: 56, color: theme.colorScheme.error),

                const SizedBox(height: 20),

                Text(
                  errorMessage(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium,
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: onRefresh,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                ),

                const SizedBox(height: 12),

                Text('Pull down to refresh', style: theme.textTheme.labelMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData currentIcon() {
    return switch (appErrorType) {
      AppErrorType.noInternet => Icons.wifi_off,
      AppErrorType.timeout => Icons.timer_off,
      AppErrorType.server => Icons.cloud_off,
      AppErrorType.notFound => Icons.search_off,
      AppErrorType.unauthorized => Icons.lock_outline,
      AppErrorType.somethingWentWrong => Icons.error_outline,
    };
  }

  String errorMessage() {
    return switch (appErrorType) {
      AppErrorType.noInternet =>
        'No internet connection. Please check your network.',
      AppErrorType.timeout => 'Request timed out. Please try again.',
      AppErrorType.server => 'Server is temporarily unavailable.',
      AppErrorType.notFound => 'Requested content was not found.',
      AppErrorType.unauthorized =>
        'You are not authorized to access this content.',
      AppErrorType.somethingWentWrong =>
        'Something went wrong. Please try again.',
    };
  }
}
