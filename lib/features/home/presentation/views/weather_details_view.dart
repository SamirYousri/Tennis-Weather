// ignore_for_file: use_super_parameters
import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/features/home/domin/entity/weather_entity.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/widgets/weather_details_view_body.dart';

class WeatherDetailsView extends StatelessWidget {
  const WeatherDetailsView({Key? key, required this.weatherEntity})
      : super(key: key);
  final WeatherEntity weatherEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const CustomAppBar(),
            WeatherDetailsViewBody(
              weatherEntity: weatherEntity,
            ),
          ],
        ),
      ),
    ));
  }
}
