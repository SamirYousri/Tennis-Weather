// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/services/AIModelService.dart';
import 'package:helping_a_tennis_player/core/utils/constant.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';
import 'package:helping_a_tennis_player/core/widgets/CustomButton.dart';
import 'package:helping_a_tennis_player/features/home/domin/entity/weather_entity.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/widgets/date_selector.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/widgets/item_weather_temp.dart';
import 'package:helping_a_tennis_player/core/services/PredictionDataService.dart';

class WeatherDetailsViewBody extends StatelessWidget {
  final WeatherEntity weatherEntity;
  final AIModelService aiModelService = AIModelService();

  WeatherDetailsViewBody({super.key, required this.weatherEntity});

  void showAdviceDialog(BuildContext context) async {
    try {
      // جلب البيانات التي سيتم تمريرها إلى خدمة AI
      List<int> features = await getPredictionData(weatherEntity);
      // الحصول على التوصية من AI
      int? prediction = await aiModelService.fetchAIAdvice(features);

      String adviceMessage;
      if (prediction == 1) {
        adviceMessage = 'The weather is good for playing tennis!';
      } else {
        adviceMessage = 'It might not be a good idea to play tennis today.';
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AI Advice'),
            content: Text(adviceMessage),
            actions: [
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to fetch advice: $e'),
            actions: [
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(
            height: 90,
            width: double.infinity,
            child: DateSelector(),
          ),
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: kPrimaryColor,
              border: Border.all(
                color: Colors.blueAccent,
                width: 6.0,
              ),
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
              ItemWeatherTemp(
                degree: weatherEntity.maxTemp,
                text: 'Max Temp',
              ),
              ItemWeatherTemp(
                degree: weatherEntity.averageTemp,
                text: 'Average Temp',
              ),
              ItemWeatherTemp(
                degree: weatherEntity.minTemp,
                text: 'Min Temp',
              ),
            ],
          ),
          const SizedBox(height: 80),
          CustomButton(
            onPressed: () => showAdviceDialog(context),
            textButton: 'Advise me',
            width: 200,
          ),
        ],
      ),
    );
  }
}
