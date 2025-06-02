import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:dev_santara/utils/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkNavigation();
  }

  void _checkNavigation() async {
    await Future.delayed(const Duration(seconds: 2)); 

    final seenOnboarding = await SharedPrefs.getOnboardingSeen();
    final isLoggedIn = await SharedPrefs.isLoggedIn();

    if (!seenOnboarding) {
      Navigator.pushReplacementNamed(context, '/onboarding1');
    } else if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E3A8A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/APK_logot.png'))
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "DEV SANTARA",
              style: WhiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

