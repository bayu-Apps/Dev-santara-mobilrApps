import 'package:dev_santara/cubit/page_cubit.dart';
import 'package:dev_santara/page/home.dart';
import 'package:dev_santara/page/onboarding1.dart';
import 'package:dev_santara/page/register.dart';
import 'package:dev_santara/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding1': (context) => const OnboardingPage(),
          '/Register': (context) => const Register(),
          '/home': (context) => const Home(),
        },
      ),
    );

    
  }
}

