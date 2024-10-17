// lib/features/home/presentation/views/home_view_body.dart
import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/app_image.dart';
import 'package:helping_a_tennis_player/core/widgets/CustomButton.dart';
import 'package:helping_a_tennis_player/core/widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_a_tennis_player/features/home/presentation/manager/weather_bloc/weather_bloc.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/widgets/bloc_builder_home_view_body.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(Assets.imagesLocation),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            controller: _controller,
            icon: Icons.map_rounded,
            labelText: 'Enter city name',
          ),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              final city = _controller.text;
              context.read<WeatherCubit>().fetchWeather(city);
            },
            width: 150,
            textButton: 'Search',
          ),
          const SizedBox(height: 16),
          const BlocBuilderHomeViewBody(),
        ],
      ),
    );
  }
}
