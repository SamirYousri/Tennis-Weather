import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: Styles.textStyle25.copyWith(color: Colors.blueAccent),
              ),
              const Text(
                'samir yousri',
                style: Styles.textStyle18,
              ),
            ],
          ),
          const Icon(
            Icons.menu,
            size: 40,
          ),
        ],
      ),
    );
  }
}
