import 'package:dev_santara/page/home.dart';
import 'package:dev_santara/page/onboarding1.dart';
import 'package:dev_santara/page/register.dart';
import 'package:dev_santara/page/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
          '/': (context) => const SplashPage(),
          '/onboarding1': (context) => const OnboardingPage(),
          '/Register': (context) => const Register(),
          '/home': (context) => const Home(),
        },
    );

    
  }
}

