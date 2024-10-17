import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/constant.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';

class ItemWeatherTemp extends StatelessWidget {
  const ItemWeatherTemp({super.key, required this.text, required this.degree});
  final String text;
  final double degree;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            border: Border.all(
              color: Colors.blueAccent,
              width: 6.0,
            ),
            borderRadius: BorderRadius.circular(200),
          ),
          child: Center(
            child: Text(
              '${degree.toStringAsFixed(1)} °C',
              style: Styles.textStyle16,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: Styles.textStyle12,
        ),
      ],
    );
  }
}
