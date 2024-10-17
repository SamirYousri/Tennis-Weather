import 'package:helping_a_tennis_player/features/home/domin/entity/weather_entity.dart';
import 'package:helping_a_tennis_player/features/home/domin/repos/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<WeatherEntity> call(String city) async {
    return await repository.getWeather(city);
  }
}
