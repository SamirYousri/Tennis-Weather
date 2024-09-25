import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/views/widget/sign_up_view_body.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpViewBody(),
    );
  }
}
