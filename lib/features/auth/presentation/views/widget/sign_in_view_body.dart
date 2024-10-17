// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_a_tennis_player/core/utils/app_image.dart';
import 'package:helping_a_tennis_player/core/utils/functions/custom_snack_bar.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';
import 'package:helping_a_tennis_player/core/widgets/CustomButton.dart';
import 'package:helping_a_tennis_player/core/widgets/custom_text_form_field.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInViewBody extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;

  SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          customSnackBar(context, 'Success.');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const HomeView();
            },
          ));
        } else if (state is SignInFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading,
          child: Scaffold(
            body: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    const Image(
                      image: AssetImage(Assets.imagesTennisLogo),
                      width: 200,
                    ),
                    const SizedBox(height: 10),
                    const Text('SIGN IN', style: Styles.textStyle35),
                    const SizedBox(height: 50),
                    CustomTextFormField(
                      onChange: (data) => email = data,
                      icon: Icons.email,
                      labelText: 'Email',
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      isHide: true,
                      onChange: (data) => password = data,
                      icon: Icons.lock,
                      labelText: 'Password',
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context
                              .read<SignInCubit>()
                              .SignIn(email: email!, password: password!);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                      textButton: 'SIGN IN',
                      width: MediaQuery.sizeOf(context).width,
                      hight: 50,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/signUp'),
                      child: const Text(
                        "Don't have an account?",
                        style: Styles.textStyle12UnderLine,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
