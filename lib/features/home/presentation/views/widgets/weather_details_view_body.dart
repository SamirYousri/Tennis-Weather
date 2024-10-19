import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/services/AIModelService.dart';
import 'package:helping_a_tennis_player/core/utils/constant.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';
import 'package:helping_a_tennis_player/core/widgets/CustomButton.dart';
import 'package:helping_a_tennis_player/features/home/domin/entity/weather_entity.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/widgets/date_selector.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/widgets/item_weather_temp.dart';

class WeatherDetailsViewBody extends StatelessWidget {
  WeatherDetailsViewBody({super.key, required this.weatherEntity});
  final WeatherEntity weatherEntity;

  final AIModelService aiModelService =
      AIModelService(); // إنشاء كائن من الخدمة

  void showAdviceDialog(BuildContext context) async {
    try {
      // الحصول على النصيحة من الذكاء الاصطناعي
      bool shouldPlay = await aiModelService.fetchAdvice(
        weatherEntity.averageTemp,
        weatherEntity.maxTemp,
        weatherEntity.minTemp,
      );

      // عرض النصيحة في دايلوج
      String adviceMessage = shouldPlay
          ? 'The weather is good for playing tennis!'
          : 'It might not be a good idea to play tennis today.';

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AI Advice'),
            content: Text(adviceMessage),
            actions: [
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      // عرض رسالة خطأ في حال فشل الحصول على النصيحة
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to fetch advice: $e'),
            actions: [
              TextButton(
                child: Text('Close'),
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
          SizedBox(
              height: 90,
              width: MediaQuery.sizeOf(context).width,
              child: const DateSelector()),
          const SizedBox(
            height: 50,
          ),
          Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      weatherEntity.location,
                      style: Styles.textStyle35,
                    ),
                    Text(
                      weatherEntity.weatherCondetion,
                      style: Styles.textStyle20,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: kPrimaryColor,
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 6.0,
                ),
              )),
          const SizedBox(
            height: 50,
          ),
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
          const SizedBox(
            height: 80,
          ),
          CustomButton(
            onPressed: () {
              showAdviceDialog(context);
            },
            textButton: 'Advise me',
            width: 200,
          ),
        ],
      ),
    );
  }
}
