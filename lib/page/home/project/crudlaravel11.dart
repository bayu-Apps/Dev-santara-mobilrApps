import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Crudlaravel11 extends StatelessWidget {
  const Crudlaravel11({super.key});

  void _launchYoutube() async {
    final Uri url = Uri.parse('https://www.youtube.com/watch?v=g1GxKD1jsXw&ab_channel=HariAspriyono');
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
            image: AssetImage('assets/images/imagetitlecrud.jpg'),
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
           
            // Container(
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
                       Image.asset('assets/icon/laravel.png',
                        width: 70,
                        height: 70,
                 ),
                  
                    ],
                  ),

                  SizedBox(height: 10,),
                  Text(
                    'CRUD LARAVEL 11',
                    style: WhiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                
                  const SizedBox(height: 6),
                  Text(
                    'Pelajari cara membuat aplikasi manajemen data buku menggunakan Laravel 11 dengan Eloquent ORM. Dalam tutorial ini, kami akan membahas langkah-langkah membuat fitur CRUD (Create, Read, Update, Delete) dengan relasi antara tiga tabel utama: Kategori, Penerbit, dan Buku. Anda akan memahami konsep relasi database seperti one-to-many dan many-to-one, serta cara implementasinya dengan Eloquent ORM. Cocok untuk pemula yang ingin meningkatkan skill Laravel.',
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
