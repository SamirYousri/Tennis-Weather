import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/app_image.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';
import 'package:helping_a_tennis_player/core/widgets/CustomButton.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/views/signIn_view.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/views/signUp_view.dart';

class RegistrationTypeViewBody extends StatelessWidget {
  const RegistrationTypeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.6,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(200),
              bottomRight: Radius.circular(200),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Image(
                image: AssetImage(Assets.imagesTennisLogo),
                width: 300,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Tennis Weather',
                style: Styles.textStyle25.copyWith(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        CustomButton(
            hight: 50,
            width: MediaQuery.sizeOf(context).width * 0.8,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SignUpView();
                },
              ));
            },
            textButton: 'SIGN UP'),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          backgroundColor: Colors.white,
          hight: 50,
          width: MediaQuery.sizeOf(context).width * 0.8,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const SignInView();
              },
            ));
          },
          textButton: 'SIGN IN',
          textColor: Colors.black,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
