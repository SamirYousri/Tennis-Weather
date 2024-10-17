class WeatherModel {
  final String location;
  final double averageTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondetion;

  WeatherModel({
    required this.location,
    required this.averageTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondetion,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['location']['name'],
      averageTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondetion: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
