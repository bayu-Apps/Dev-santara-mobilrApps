// ignore_for_file: prefer_const_constructors

import 'package:dev_santara/shared/theme.dart';
import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Cssmateri extends StatefulWidget {
  const Cssmateri({super.key});

  @override
  State<Cssmateri> createState() => _CssmateriState();
}

class _CssmateriState extends State<Cssmateri> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> materiCSS = [
    {
      "judul": "1. Apa itu CSS?",
      "isi": "CSS (Cascading Style Sheets) adalah bahasa untuk mengatur tampilan halaman web.",
      "kode": "body {\n  background-color: lightblue;\n}",
      "link": "https://www.w3schools.com/css/css_intro.asp"
    },
    {
      "judul": "2. Selector CSS",
      "isi": "Selector digunakan untuk memilih elemen HTML yang akan di-style.",
      "kode": "p {\n  color: red;\n}",
      "link": "https://www.w3schools.com/css/css_selectors.asp"
    },
    {
      "judul": "3. Properti Warna",
      "isi": "CSS memiliki properti warna seperti color, background-color, border-color.",
      "kode": "h1 {\n  color: navy;\n  background-color: yellow;\n}",
      "link": "https://www.w3schools.com/css/css_colors.asp"
    },
    {
      "judul": "4. Font dan Teks",
      "isi": "Mengatur jenis font, ukuran, style, dan alignment teks.",
      "kode": "p {\n  font-family: Arial;\n  font-size: 16px;\n  text-align: center;\n}",
      "link": "https://www.w3schools.com/css/css_font.asp"
    },
    {
      "judul": "5. Box Model",
      "isi": "Box model terdiri dari margin, border, padding, dan content.",
      "kode": "div {\n  margin: 10px;\n  padding: 20px;\n  border: 1px solid black;\n}",
      "link": "https://www.w3schools.com/css/css_boxmodel.asp"
    },
    {
      "judul": "6. Layout dengan Flexbox",
      "isi": "Flexbox digunakan untuk membuat layout fleksibel dan responsif.",
      "kode": "container {\n  display: flex;\n  justify-content: center;\n}",
      "link": "https://www.w3schools.com/css/css3_flexbox.asp"
    },
    {
      "judul": "7. Positioning",
      "isi": "Mengatur posisi elemen dengan static, relative, absolute, fixed.",
      "kode": "div {\n  position: absolute;\n  top: 10px;\n  left: 20px;\n}",
      "link": "https://www.w3schools.com/css/css_positioning.asp"
    },
    {
      "judul": "8. Pseudo-class",
      "isi": "Pseudo-class seperti :hover, :focus untuk efek interaktif.",
      "kode": "a:hover {\n  color: green;\n}",
      "link": "https://www.w3schools.com/css/css_pseudo_classes.asp"
    },
    {
      "judul": "9. Transisi dan Animasi",
      "isi": "Menambahkan efek transisi dan animasi pada elemen.",
      "kode": "button {\n  transition: background-color 0.5s ease;\n}",
      "link": "https://www.w3schools.com/css/css3_transitions.asp"
    },
    {
      "judul": "10. Responsive Design",
      "isi": "Menggunakan media query untuk tampilan responsif di berbagai perangkat.",
      "kode": "@media (max-width: 600px) {\n  body {\n    background-color: lightgray;\n  }\n}",
      "link": "https://www.w3schools.com/css/css_rwd_mediaqueries.asp"
    }
  ];

  List<Map<String, String>> filteredMateri = [];

  @override
  void initState() {
    super.initState();
    filteredMateri = List.from(materiCSS);

    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        filteredMateri = materiCSS.where((materi) {
          final judul = materi['judul']!.toLowerCase();
          final isi = materi['isi']!.toLowerCase();
          return judul.contains(query) || isi.contains(query);
        }).toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _launchURL(String urlString) async {
    final url = Uri.parse(urlString);
    if (!await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.inAppBrowserView);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tidak dapat membuka tautan')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E3A8A),
      appBar: AppBar(
        title: Text("Materi CSS",
        style: WhiteTextStyle,
        ),
        backgroundColor: Color(0xFF1E3A8A),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Cari materi CSS...',
                  hintStyle: TextStyle(color: Colors.white60),
                  filled: true,
                  fillColor: Colors.indigo[700],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
            // List materi
            Expanded(
              child: ListView.builder(
                itemCount: filteredMateri.length,
                itemBuilder: (context, index) {
                  final materi = filteredMateri[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Card(
                      color: Color(0xFF2C3E50),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              materi['judul']!,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              materi['isi']!,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xFF34495E),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  materi['kode']!,
                                  style: TextStyle(
                                    fontFamily: 'monospace',
                                    fontSize: 14,
                                    color: Colors.white60,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () => _launchURL(materi['link']!),
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Pelajari Lebih Lanjut",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
