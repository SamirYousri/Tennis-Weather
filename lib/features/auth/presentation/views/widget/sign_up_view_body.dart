// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_a_tennis_player/core/utils/app_image.dart';
import 'package:helping_a_tennis_player/core/utils/functions/custom_snack_bar.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';
import 'package:helping_a_tennis_player/core/widgets/CustomButton.dart';
import 'package:helping_a_tennis_player/core/widgets/custom_text_form_field.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/views/signIn_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBody extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;

  SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          customSnackBar(context, 'The account has been created successfully.');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const SignInView();
            },
          ));
        } else if (state is SignUpFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
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
                    const Text('SIGN UP', style: Styles.textStyle35),
                    const SizedBox(height: 50),
                    CustomTextFormField(
                      icon: Icons.person,
                      labelText: 'Full Name',
                    ),
                    const SizedBox(height: 20),
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
                              .read<SignUpCubit>()
                              .SignUp(email: email!, password: password!);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                      textButton: 'SIGN UP',
                      width: MediaQuery.sizeOf(context).width,
                      hight: 50,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/signIn'),
                      child: const Text(
                        'Have an account?',
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
