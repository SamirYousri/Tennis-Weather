import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';
import 'package:helping_a_tennis_player/core/widgets/CustomButton.dart';
import 'package:helping_a_tennis_player/features/on_boarding_screen/presentation/views/widget/dot_indicator.dart';

class ItemPageView extends StatelessWidget {
  const ItemPageView({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.textButton,
    this.onPressed,
    required this.currentPageIndex,
  });
  final int currentPageIndex;
  final String image;
  final String title;
  final String subTitle;
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 150,
        left: 20,
        right: 20,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            height: 360,
            image: AssetImage(image),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            title,
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.center,
            subTitle,
            style: Styles.textStyle12,
          ),
          const Expanded(
            child: SizedBox(
              height: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DotIndicator(
                currentPageIndex: currentPageIndex,
              ),
              CustomButton(onPressed: onPressed, textButton: textButton),
            ],
          ),
        ],
      ),
    );
  }
}
