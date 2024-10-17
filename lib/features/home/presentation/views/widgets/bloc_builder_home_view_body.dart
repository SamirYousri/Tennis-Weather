// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_a_tennis_player/features/home/presentation/manager/weather_bloc/weather_bloc.dart';
import 'package:helping_a_tennis_player/features/home/presentation/manager/weather_bloc/weather_state.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/weather_details_view.dart';

class BlocBuilderHomeViewBody extends StatelessWidget {
  const BlocBuilderHomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WeatherDetailsView(
                  weatherEntity: state.weather,
                ),
              ),
            );
          });
          return const SizedBox();
        } else if (state is WeatherError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}
