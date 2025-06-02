// ignore_for_file: prefer_const_constructors

import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Htmlmateri extends StatefulWidget {
  const Htmlmateri({super.key});

  @override
  State<Htmlmateri> createState() => _HtmlmateriState();
}

class _HtmlmateriState extends State<Htmlmateri> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> materiHTML = [
    {
      "judul": "1. Apa itu HTML?",
      "isi":
          "HTML (HyperText Markup Language) adalah bahasa markup standar untuk membuat halaman web.",
      "kode":
          "<!DOCTYPE html>\n<html>\n  <head><title>Judul</title></head>\n  <body>Halo Dunia!</body>\n</html>",
      "link": "https://www.w3schools.com/html/html_intro.asp"
    },
    {
      "judul": "2. Struktur Dasar HTML",
      "isi":
          "Setiap dokumen HTML memiliki struktur dasar seperti tag <html>, <head>, dan <body>.",
      "kode": "<html>\n  <head>...</head>\n  <body>...</body>\n</html>",
      "link": "https://www.w3schools.com/html/html_basic.asp"
    },
    {
      "judul": "3. Heading dan Paragraf",
      "isi": "Gunakan <h1> hingga <h6> untuk heading dan <p> untuk paragraf.",
      "kode": "<h1>Heading Besar</h1>\n<p>Ini paragraf.</p>",
      "link": "https://www.w3schools.com/html/html_headings.asp"
    },
    {
      "judul": "4. Tag Link",
      "isi": "Tag <a> digunakan untuk membuat hyperlink.",
      "kode": "<a href=\"https://google.com\">Kunjungi Google</a>",
      "link": "https://www.w3schools.com/html/html_links.asp"
    },
    {
      "judul": "5. Gambar HTML",
      "isi": "Gunakan tag <img> untuk menampilkan gambar.",
      "kode": "<img src=\"logo.png\" alt=\"Logo\">",
      "link": "https://www.w3schools.com/html/html_images.asp"
    },
    {
      "judul": "6. Daftar (List)",
      "isi": "Gunakan <ul>, <ol>, dan <li> untuk membuat daftar.",
      "kode": "<ul><li>Item 1</li><li>Item 2</li></ul>",
      "link": "https://www.w3schools.com/html/html_lists.asp"
    },
    {
      "judul": "7. Tabel",
      "isi": "Gunakan <table>, <tr>, <td> untuk membuat tabel.",
      "kode": "<table><tr><td>Data</td></tr></table>",
      "link": "https://www.w3schools.com/html/html_tables.asp"
    },
    {
      "judul": "8. Form Input",
      "isi": "Gunakan tag <form>, <input>, <label> untuk form.",
      "kode": "<form><input type=\"text\" /></form>",
      "link": "https://www.w3schools.com/html/html_forms.asp"
    },
    {
      "judul": "9. Tag Div dan Span",
      "isi": "<div> digunakan sebagai container, <span> untuk inline.",
      "kode": "<div>Kontainer</div>\n<span>Inline</span>",
      "link": "https://www.w3schools.com/html/html_blocks.asp"
    },
    {
      "judul": "10. HTML Semantik",
      "isi":
          "Tag semantik seperti <header>, <footer>, <section> memperjelas struktur halaman.",
      "kode": "<header>Judul</header>\n<section>Isi</section>",
      "link": "https://www.w3schools.com/html/html5_semantic_elements.asp"
    }
  ];

  List<Map<String, String>> filteredMateri = [];

  @override
  void initState() {
    super.initState();
    filteredMateri = List.from(materiHTML);

    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        filteredMateri = materiHTML.where((materi) {
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
        title: Text("Materi Html",
        style: WhiteTextStyle,
        ),
        backgroundColor: Color(0xFF1E3A8A),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Tombol kembali & search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Cari materi Html...',
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
                ],
              ),
            ),
            // Daftar materi
            Expanded(
              child: ListView.builder(
                itemCount: filteredMateri.length,
                itemBuilder: (context, index) {
                  final materi = filteredMateri[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Card(
                      color: Color(0xFF2C3E50), // background card dark
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
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
