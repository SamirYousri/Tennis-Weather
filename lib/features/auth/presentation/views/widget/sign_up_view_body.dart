import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/app_image.dart';
import 'package:helping_a_tennis_player/core/utils/styles.dart';
import 'package:helping_a_tennis_player/core/widgets/CustomButton.dart';
import 'package:helping_a_tennis_player/core/widgets/custom_text_form_field.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/views/widget/sign_in_view_body.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
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
                  'SIGN UP',
                  style: Styles.textStyle35,
                ),
                const SizedBox(
                  height: 50,
                ),
                const CustomTextFormField(
                  icon: Icons.person,
                  labelText: 'Full Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextFormField(
                  icon: Icons.email,
                  labelText: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextFormField(
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
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  textButton: 'SIGN UP',
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
                        return const SignInViewBody();
                      },
                    ));
                  },
                  child: const Text(
                    'have an account ?',
                    style: Styles.textStyle12UnderLine,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
