import 'package:helping_a_tennis_player/features/home/domin/entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeather(String city);
}
