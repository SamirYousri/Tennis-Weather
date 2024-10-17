import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_a_tennis_player/features/home/domin/usecase/get_weather_usecase.dart';
import 'package:helping_a_tennis_player/features/home/presentation/manager/weather_bloc/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherCubit(this.getWeatherUseCase) : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    try {
      emit(WeatherLoading());
      final weather = await getWeatherUseCase(city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
