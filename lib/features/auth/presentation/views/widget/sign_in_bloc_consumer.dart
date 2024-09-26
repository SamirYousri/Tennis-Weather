// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:helping_a_tennis_player/core/utils/functions/custom_snack_bar.dart';
// import 'package:helping_a_tennis_player/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
// import 'package:helping_a_tennis_player/features/auth/presentation/views/widget/sign_in_view_body.dart';
// import 'package:helping_a_tennis_player/features/home/presentation/views/home_view.dart';

// class SignUpBlocConsumer extends StatelessWidget {
//   const SignUpBlocConsumer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SignInCubit, SignInState>(
//       listener: (context, state) {
//         if (state is SignInSuccess) {
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) {
//               return const HomeView();
//             },
//           ));
//         } else if (state is SignInFailure) {
//            customSnackBar(context, state.errMessage);
//         } else {
//           const CircularProgressIndicator();
//         }
//       },
//       builder: (context, state) {
//         return const SignInViewBody();
//       },
//     );
//   }
// }
