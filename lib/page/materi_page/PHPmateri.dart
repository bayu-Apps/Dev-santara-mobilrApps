// ignore_for_file: prefer_const_constructors

import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PHPMateri extends StatefulWidget {
  const PHPMateri({super.key});

  @override
  State<PHPMateri> createState() => _PHPMateriState();
}

class _PHPMateriState extends State<PHPMateri> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> materiPHP = [
    {
      "judul": "1. Apa itu PHP?",
      "isi": "PHP adalah bahasa pemrograman server-side yang dirancang untuk pengembangan web.",
      "kode": "<?php\necho 'Halo Dunia!';\n?>",
      "link": "https://www.w3schools.com/php/php_intro.asp"
    },
    {
      "judul": "2. Variabel di PHP",
      "isi": "Variabel di PHP diawali dengan tanda dollar (\$) dan tidak perlu deklarasi tipe data.",
      "kode": "<?php\n\$nama = 'Bayu';\n\$umur = 17;\n\$aktif = true;\n?>",
      "link": "https://www.w3schools.com/php/php_variables.asp"
    },
    {
      "judul": "3. Fungsi di PHP",
      "isi": "Fungsi dideklarasikan dengan kata kunci function diikuti dengan nama fungsi.",
      "kode": "<?php\nfunction tambah(\$a, \$b) {\n  return \$a + \$b;\n}\necho tambah(5, 3);\n?>",
      "link": "https://www.w3schools.com/php/php_functions.asp"
    },
    {
      "judul": "4. Kondisional if-else",
      "isi": "Gunakan if, else if, dan else untuk pengambilan keputusan.",
      "kode": "<?php\n\$nilai = 80;\nif (\$nilai >= 90) {\n  echo 'A';\n} elseif (\$nilai >= 75) {\n  echo 'B';\n} else {\n  echo 'C';\n}\n?>",
      "link": "https://www.w3schools.com/php/php_if_else.asp"
    },
    {
      "judul": "5. Looping di PHP",
      "isi": "PHP mendukung for, while, dan foreach untuk pengulangan.",
      "kode": "<?php\nfor (\$i = 0; \$i < 5; \$i++) {\n  echo \$i . \"\\n\";\n}\n?>",
      "link": "https://www.w3schools.com/php/php_looping.asp"
    },
    {
      "judul": "6. Array di PHP",
      "isi": "Array menyimpan beberapa nilai dalam satu variabel.",
      "kode": "<?php\n\$buah = ['apel', 'jeruk', 'pisang'];\necho \$buah[1]; // jeruk\n?>",
      "link": "https://www.w3schools.com/php/php_arrays.asp"
    },
    {
      "judul": "7. Object di PHP (OOP)",
      "isi": "PHP mendukung Object-Oriented Programming menggunakan class dan object.",
      "kode": "<?php\nclass Orang {\n  public \$nama;\n  function __construct(\$nama) {\n    \$this->nama = \$nama;\n  }\n}\n\$orang = new Orang('Bayu');\necho \$orang->nama;\n?>",
      "link": "https://www.w3schools.com/php/php_oop.asp"
    },
    {
      "judul": "8. Form Handling",
      "isi": "PHP digunakan untuk memproses data dari formulir HTML.",
      "kode": "<?php\nif (\$_SERVER['REQUEST_METHOD'] == 'POST') {\n  \$nama = \$_POST['nama'];\n  echo \"Halo, \$nama\";\n}\n?>",
      "link": "https://www.w3schools.com/php/php_forms.asp"
    },
    {
      "judul": "9. File Handling",
      "isi": "PHP dapat membaca dan menulis file menggunakan fungsi seperti fopen dan fwrite.",
      "kode": "<?php\n\$file = fopen(\"data.txt\", \"w\");\nfwrite(\$file, \"Halo Dunia\");\nfclose(\$file);\n?>",
      "link": "https://www.w3schools.com/php/php_file_handling.asp"
    },
    {
      "judul": "10. Koneksi ke MySQL",
      "isi": "Gunakan mysqli atau PDO untuk menghubungkan ke database MySQL.",
      "kode": "<?php\n\$conn = new mysqli(\"localhost\", \"user\", \"pass\", \"db\");\nif (\$conn->connect_error) {\n  die(\"Koneksi gagal: \" . \$conn->connect_error);\n}\necho \"Terhubung\";\n?>",
      "link": "https://www.w3schools.com/php/php_mysql_intro.asp"
    }
  ];

  List<Map<String, String>> filteredMateri = [];

  @override
  void initState() {
    super.initState();
    filteredMateri = List.from(materiPHP);

    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        filteredMateri = materiPHP.where((materi) {
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
      await launchUrl(url, mode: LaunchMode.inAppWebView);
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
        title: Text(
          'Materi PHP',
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
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Cari materi...',
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Card(
                      color: Color(0xFF2C3E50),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
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
                                  color: Colors.lightBlueAccent),
                            ),
                            SizedBox(height: 12),
                            Text(
                              materi['isi']!,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70),
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
                                      color: Colors.white60),
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
                                      fontWeight: FontWeight.w600),
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