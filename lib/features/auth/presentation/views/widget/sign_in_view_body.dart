import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_a_tennis_player/core/utils/app_image.dart';
import 'package:helping_a_tennis_player/core/utils/functions/custom_snack_bar.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';
import 'package:helping_a_tennis_player/core/widgets/CustomButton.dart';
import 'package:helping_a_tennis_player/core/widgets/custom_text_form_field.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/views/widget/sign_up_view_body.dart';
import 'package:helping_a_tennis_player/features/home/presentation/views/home_view.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          customSnackBar(context, 'success.');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const HomeView();
            },
          ));
        } else if (state is SignInFailure) {
          return customSnackBar(context, state.errMessage);
        } else {
          const CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Form(
            autovalidateMode: autovalidateMode,
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 120, bottom: 50, right: 30, left: 30),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage(Assets.imagesTennisLogo),
                      width: 200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'SIGN IN',
                      style: Styles.textStyle35,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextFormField(
                      onChange: (data) {
                        email = data;
                      },
                      icon: Icons.email,
                      labelText: 'Email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      onChange: (data) {
                        password = data;
                      },
                      icon: Icons.lock,
                      labelText: 'Password',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<SignInCubit>(context)
                              .SignIn(email: email!, password: password!);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                      textButton: 'SIGN IN',
                      width: MediaQuery.sizeOf(context).width,
                      hight: 50,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SignUpViewBody();
                          },
                        ));
                      },
                      child: const Text(
                        "don't have an account ?",
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
