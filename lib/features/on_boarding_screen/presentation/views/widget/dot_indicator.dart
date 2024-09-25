import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/features/on_boarding_screen/presentation/views/widget/custom_dot.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.currentPageIndex});
  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 6),
          child: CustomDot(
            isActive: index == currentPageIndex,
          ),
        ),
      ),
    );
  }
}
