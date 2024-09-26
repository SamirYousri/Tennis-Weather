// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:helping_a_tennis_player/core/utils/functions/custom_snack_bar.dart';
// import 'package:helping_a_tennis_player/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
// import 'package:helping_a_tennis_player/features/auth/presentation/views/signIn.dart';
// import 'package:helping_a_tennis_player/features/auth/presentation/views/widget/sign_up_view_body.dart';

// class SignUpBlocConsumer extends StatelessWidget {
//   const SignUpBlocConsumer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SignUpCubit, SignUpState>(
//       listener: (context, state) {
//         if (state is SignUpSuccess) {
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) {
//               return const SignIn();
//             },
//           ));
//         } else if (state is SignUpFailuer) {
//           return customSnackBar(context, state.errMessage);
//         } else {
//           const CircularProgressIndicator();
//         }
//       },
//       builder: (context, state) {
//         return const SignUpViewBody();
//       },
//     );
//   }
// }
