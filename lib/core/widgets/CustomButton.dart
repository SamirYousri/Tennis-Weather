// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.textButton,
    this.hight = 40,
    this.width = 100,
  });

  final void Function()? onPressed;
  final String textButton;
  final double hight, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: const Color(0xff014BB4),
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: Styles.textStyle20,
        ),
      ),
    );
  }
}
