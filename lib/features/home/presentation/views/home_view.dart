// lib/presentation/views/home_screen.dart
import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const CustomAppBar(),
            HomeViewBody(),
          ],
        ),
      ),
    ));
  }
}
