// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherRemoteDataSource {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '57fc293268b74e958be210912241710';

  Future<WeatherModel> getWeather(String city) async {
    final url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$city');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
