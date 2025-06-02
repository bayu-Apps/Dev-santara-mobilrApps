import 'package:dev_santara/services/auth_service.dart';
import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E3A8A),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/APK_logot.png'),
                  ),
                ),
              ),

              SizedBox(height: 25),

              // Text
              Text(
                "Selamat datang! 🎉\nKami senang Anda di sini. Silakan masuk untuk melanjutkan.",
                style: WhiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),

              // Google Button
              ElevatedButton(
                onPressed: () async {
                final userCredential = await AuthService().signInWithGoogle();

                if (userCredential != null) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login gagal! Coba lagi.")),
                  );
                }
              },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1E3A8A),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                    )
                  ),
                  minimumSize: Size(double.infinity, 50), 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/google_icon.png', 
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 12),
                    Text(
                     'Login with Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Guest Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1E3A8A),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                    )
                  ),
                  minimumSize: Size(double.infinity, 50), 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/user.png', 
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Use guest mode',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Login Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/Login'); 
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                       color: Color(0xFFFFD500),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}