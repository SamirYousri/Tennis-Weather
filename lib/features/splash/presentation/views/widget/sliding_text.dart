import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'Tennis Weather',
              style: Styles.textStyle25,
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
