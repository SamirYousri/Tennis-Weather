// ignore_for_file: override_on_non_overriding_member

import 'package:helping_a_tennis_player/features/home/data/dataSource/weather_remote_datasource.dart';
import 'package:helping_a_tennis_player/features/home/domin/entity/weather_entity.dart';
import 'package:helping_a_tennis_player/features/home/domin/repos/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<WeatherEntity> getWeather(String city) async {
    final model = await remoteDataSource.getWeather(city);
    return WeatherEntity(
      location: model.location,
      averageTemp: model.averageTemp,
      maxTemp: model.maxTemp,
      minTemp: model.minTemp,
      weatherCondetion: model.weatherCondetion,
    );
  }
}
