import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/cubit/network_cubit.dart';
import 'animated_message.dart';

class NetworkMessageOverlay extends StatefulWidget {
  final Widget child;

  const NetworkMessageOverlay({super.key, required this.child});

  @override
  State<NetworkMessageOverlay> createState() => _NetworkMessageOverlayState();
}

class _NetworkMessageOverlayState extends State<NetworkMessageOverlay> {
  String? _message;
  bool _isConnected = false;
  int _messageKey = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCubit, bool>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, connected) {
        setState(() {
          _isConnected = connected;
          _message = connected
              ? "You're back online"
              : 'No internet connection';

          _messageKey++;
        });
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          widget.child,

          if (_message != null)
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedMessage(
                  key: ValueKey(_messageKey),
                  message: _message!,
                  isConnected: _isConnected,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
