// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/features/home/domin/entity/weather_entity.dart';

Future<List<int>> getPredictionData(WeatherEntity weatherEntity) async {
  List<int> predictions = [];

  if (weatherEntity.weatherCondetion.toLowerCase() == "sunny") {
    predictions.add(1);
  } else {
    predictions.add(0);
  }

  if (weatherEntity.minTemp > 30) {
    predictions.add(1);
  } else {
    predictions.add(0);
  }

  if (weatherEntity.maxTemp <= 60) {
    predictions.add(1);
  } else {
    predictions.add(0);
  }

  if (weatherEntity.averageTemp <= 15) {
    predictions.add(1);
  } else {
    predictions.add(0);
  }

  debugPrint("$predictions");
  return predictions;
}
