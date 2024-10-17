// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/views/widget/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInViewBody(),
    );
  }
}
