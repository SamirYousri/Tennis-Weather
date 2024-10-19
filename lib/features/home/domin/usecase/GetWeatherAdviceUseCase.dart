// ignore_for_file: file_names

import 'package:helping_a_tennis_player/core/services/AIModelService.dart';
import 'package:helping_a_tennis_player/features/home/domin/entity/weather_entity.dart';

class GetWeatherAdviceUseCase {
  final AIModelService aiModelService;

  GetWeatherAdviceUseCase(this.aiModelService);

  Future<bool> execute(WeatherEntity weatherEntity) async {
    return await aiModelService.fetchAdvice(
      weatherEntity.averageTemp,
      weatherEntity.maxTemp,
      weatherEntity.minTemp,
    );
  }
}
