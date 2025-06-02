import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  void _launchYoutube() async {
    final Uri url = Uri.parse('https://youtu.be/00gyCtIQp8E?si=GUrdCDsmMOBdXAaL');
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
            image: AssetImage('assets/images/imagetitlelp.jpg'),
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
        
            //   margin: const EdgeInsets.only(top: 180),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Lake Ciliwung',
            //               overflow: TextOverflow.ellipsis,
            //               style: WhiteTextStyle.copyWith(
            //                 fontSize: 24,
            //                 fontWeight: semiBold,
            //               ),
            //             ),
            //             Text(
            //               'Tangerang',
            //               style: WhiteTextStyle.copyWith(
            //                 fontSize: 16,
            //                 fontWeight: light,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Row(
            //         children: [
            //           Container(
            //             width: 20,
            //             height: 20,
            //             margin: const EdgeInsets.only(right: 2),
            //             decoration: const BoxDecoration(
            //               image: DecorationImage(
            //                 image: AssetImage('assets/icon_star.png'),
            //               ),
            //             ),
            //           ),
            //           Text(
            //             '4.5',
            //             style: WhiteTextStyle.copyWith(fontWeight: medium),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

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
                       Image.asset('assets/icon/html.png',
                        width: 70,
                        height: 70,
                 ),
                  Image.asset('assets/icon/tailwind.png',
                 width: 70,
                 height: 70,
                 ),
                    ],
                  ),
                  Text(
                    'MEMBUAT LANDING PAGE',
                    style: WhiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                
                  const SizedBox(height: 6),
                  Text(
                    'Landing page ini mengusung desain minimalis dan modern, dengan perpaduan warna yang elegan seperti putih bersih, abu-abu muda, dan aksen biru neon untuk menonjolkan elemen penting. Tipografi yang digunakan bersih dan tegas, memberikan kesan profesional namun tetap ramah di mata.',
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
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'Kembali',
            ),
          ],
        ),
      ),
    );
  }
}