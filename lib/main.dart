import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helping_a_tennis_player/core/utils/constant.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:helping_a_tennis_player/features/home/data/dataSource/weather_remote_datasource.dart';
import 'package:helping_a_tennis_player/features/home/data/repos_impl/weather_repository_impl.dart';
import 'package:helping_a_tennis_player/features/home/domin/usecase/get_weather_usecase.dart';
import 'package:helping_a_tennis_player/features/home/presentation/manager/weather_bloc/weather_bloc.dart';
import 'package:helping_a_tennis_player/features/splash/presentation/views/splash_view.dart';
import 'package:helping_a_tennis_player/firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('en');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const TennisWeather());
}

class TennisWeather extends StatelessWidget {
  const TennisWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final weatherRemoteDataSource = WeatherRemoteDataSource();
    final weatherRepository = WeatherRepositoryImpl(weatherRemoteDataSource);
    final getWeatherUseCase = GetWeatherUseCase(weatherRepository);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
        BlocProvider(
          create: (context) => WeatherCubit(getWeatherUseCase),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        home: const SplashView(),
        //   const HomeView(),
      ),
    );
  }
}
