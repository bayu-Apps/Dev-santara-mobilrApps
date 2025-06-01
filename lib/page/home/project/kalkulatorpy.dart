import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Kalkulatorpy extends StatelessWidget {
  const Kalkulatorpy({super.key});

  void _launchYoutube() async {
    final Uri url = Uri.parse('https://www.youtube.com/watch?v=KrG8asvoh-8&t=266s&ab_channel=SantriIT');
    if(!await canLaunchUrl(url)){
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }else{
      throw "Gagal Memuat Vidio";
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/imagetitlepy.jpg'),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: DefaultMargin),
        child: Column(
          children: [
           
           

          SizedBox(height: 250,),
            // Content box
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 38, 82, 204), 
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                       Image.asset('assets/icon/python_icon.png',
                        width: 90,
                        height: 70,
                 ),
                 
                  
                    ],
                  ),

                  SizedBox(height: 10,),
                  Text(
                    'MEMBUAT KALKULATOR',
                    style: WhiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                
                  const SizedBox(height: 6),
                  Text(
                    'kali ini, kita akan belajar cara membuat program kalkulator sederhana menggunakan bahasa pemrograman Python. 🐍💻 Video ini cocok banget buat kamu yang sedang belajar Python atau ingin memahami konsep dasar pemrograman.',
                    style: WhiteTextStyle.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 20),

                  // Interests
                  Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 30),
              
                
                  //buttonyoutube
                  child: GestureDetector(
                    onTap: _launchYoutube,
                    child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xff5E91F8)
                    ),
                    child: Center(
                      child: Text(
                        'Mulai',
                        style: WhiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                  ),
                 
                
            
            ),
                  const SizedBox(height: 10),
                ],
                
              ),
              
            ),

            // Price and Book
           
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xff1E3A8A),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
