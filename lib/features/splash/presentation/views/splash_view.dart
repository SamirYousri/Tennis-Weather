import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/features/splash/presentation/views/widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewbody(),
    );
  }
}
