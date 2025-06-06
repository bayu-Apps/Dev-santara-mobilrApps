import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:dev_santara/services/auth_service.dart';



class Register extends StatelessWidget {
  const Register({super.key});

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
                "Mulailah perjalanan Anda dalam menguasai pemrograman hari ini — kapan saja, di mana saja.",
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
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Center(child: CircularProgressIndicator(color: Colors.white)),
  );

  final userCredential = await AuthService().signInWithGoogle();

  Navigator.pop(context); 

  if (userCredential != null) {
    Navigator.pushReplacementNamed(context, '/home');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login Gagal!")),
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
                      'Sign Up Using Google Account',
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

             
            ],
          ),
        ),
      ),
    );
  }
}