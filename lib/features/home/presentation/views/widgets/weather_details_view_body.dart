// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/constant.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';
import 'package:helping_a_tennis_player/core/widgets/CustomButton.dart';
import 'package:helping_a_tennis_player/features/home/domin/entity/weather_entity.dart';
import 'package:helping_a_tennis_player/features/home/domin/usecase/GetWeatherAdviceUseCase.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/widgets/date_selector.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/widgets/item_weather_temp.dart';

class WeatherDetailsViewBody extends StatelessWidget {
  final WeatherEntity weatherEntity;
  final GetWeatherAdviceUseCase? getWeatherAdviceUseCase;

  const WeatherDetailsViewBody({
    super.key,
    required this.weatherEntity,
    this.getWeatherAdviceUseCase,
  });

  void _showAdviceDialog(BuildContext context, bool canPlay) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Advice'),
          content: Text(
            canPlay ? 'You can play!' : 'Not suitable for playing.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 90, child: DateSelector()),
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: kPrimaryColor,
              border: Border.all(color: Colors.blueAccent, width: 6.0),
            ),
            child: Column(
              children: [
                Text(weatherEntity.location, style: Styles.textStyle35),
                Text(weatherEntity.weatherCondetion, style: Styles.textStyle20),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemWeatherTemp(degree: weatherEntity.maxTemp, text: 'Max Temp'),
              ItemWeatherTemp(
                  degree: weatherEntity.averageTemp, text: 'Average Temp'),
              ItemWeatherTemp(degree: weatherEntity.minTemp, text: 'Min Temp'),
            ],
          ),
          const SizedBox(height: 80),
          CustomButton(
            onPressed: () async {
              final canPlay =
                  await getWeatherAdviceUseCase!.execute(weatherEntity);
              _showAdviceDialog(context, canPlay);
            },
            textButton: 'Advise me',
            width: 200,
          ),
        ],
      ),
    );
  }
}
