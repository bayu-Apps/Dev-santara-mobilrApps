import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const   SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3), () {
    Navigator.pushReplacementNamed(context, '/onboarding1');
  });

    return Scaffold(
      backgroundColor: Color(0xff1E3A8A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/LogoAplikasi.png'))
              ),
            ),
            SizedBox(height: 15,),
            Text("DEV SANTARA",
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