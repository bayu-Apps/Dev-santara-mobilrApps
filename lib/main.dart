import 'package:dev_santara/cubit/page_cubit.dart';
import 'package:dev_santara/page/home.dart';
import 'package:dev_santara/page/main_page.dart';
import 'package:dev_santara/page/onboarding1.dart';
import 'package:dev_santara/page/quiz_page.dart';
import 'package:dev_santara/page/register.dart';
import 'package:dev_santara/page/splash_page.dart';
import 'package:dev_santara/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          '/': (context) => const SplashScreen(),
          '/onboarding1': (context) => const OnboardingPage(),
          '/Register': (context) => const Register(),
          '/home': (context) => const MainPage(),
        },
      ),
    );
  }
}
