// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/views/widget/sign_in_view_body.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInViewBody(),
    );
  }
}
