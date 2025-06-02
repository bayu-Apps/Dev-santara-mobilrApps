// ignore_for_file: prefer_const_constructors

import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JavascriptMateri extends StatefulWidget {
  const JavascriptMateri({super.key});

  @override
  State<JavascriptMateri> createState() => _JavascriptMateriState();
}

class _JavascriptMateriState extends State<JavascriptMateri> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> materiJS = [
    {
      "judul": "1. Apa itu JavaScript?",
      "isi":
          "JavaScript adalah bahasa pemrograman yang digunakan untuk membuat halaman web menjadi interaktif.",
         "kode": "console.log('Halo Dunia!');\n\nfunction greet(name) {\n  return `Hello, \${name}!`;\n}\nconsole.log(greet('Bayu'));",
      "link": "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Introduction"
    },
    {
      "judul": "2. Variabel di JavaScript",
      "isi":
          "Gunakan var, let, atau const untuk mendeklarasikan variabel.",
      "kode":
          "let nama = 'Bayu';\nconst umur = 17;\nvar aktif = true;",
      "link": "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#Declarations"
    },
    {
      "judul": "3. Fungsi di JavaScript",
      "isi":
          "Fungsi dapat dideklarasikan menggunakan function atau arrow function.",
      "kode":
          "function tambah(a, b) {\n  return a + b;\n}\n\nconst kurang = (a, b) => a - b;",
      "link": "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions"
    },
    {
      "judul": "4. Kondisional if-else",
      "isi":
          "Gunakan if, else if, dan else untuk membuat keputusan berdasarkan kondisi.",
      "kode":
          "let nilai = 80;\nif (nilai >= 90) {\n  console.log('A');\n} else if (nilai >= 75) {\n  console.log('B');\n} else {\n  console.log('C');\n}",
      "link": "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Control_flow_and_error_handling#Conditional_statements"
    },
    {
      "judul": "5. Looping di JavaScript",
      "isi":
          "Gunakan for, while, dan do-while untuk pengulangan.",
      "kode":
          "for (let i = 0; i < 5; i++) {\n  console.log(i);\n}",
      "link": "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration"
    },
    {
      "judul": "6. Array di JavaScript",
      "isi":
          "Array digunakan untuk menyimpan banyak nilai dalam satu variabel.",
      "kode":
          "const buah = ['apel', 'jeruk', 'pisang'];\nconsole.log(buah[1]); // jeruk",
      "link": "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array"
    },
    {
      "judul": "7. Object di JavaScript",
      "isi":
          "Object menyimpan data dalam format key-value.",
      "kode":
          "const orang = { nama: 'Bayu', umur: 17 };\nconsole.log(orang.nama);",
      "link": "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects"
    },
    {
      "judul": "8. Event Handling",
      "isi":
          "JavaScript dapat menangani event, seperti klik tombol.",
      "kode":
          "document.getElementById('btn').addEventListener('click', () => {\n  alert('Tombol diklik!');\n});",
      "link": "https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener"
    },
    {
      "judul": "9. DOM Manipulation",
      "isi":
          "JavaScript dapat mengubah elemen HTML menggunakan DOM.",
      "kode":
          "document.getElementById('judul').textContent = 'Judul Baru';",
      "link": "https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction"
    },
    {
      "judul": "10. Promise dan Async/Await",
      "isi":
          "Digunakan untuk menangani operasi asynchronous.",
      "kode":
          "const fetchData = async () => {\n  const response = await fetch('https://api.example.com/data');\n  const data = await response.json();\n  console.log(data);\n};",
      "link": "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises"
    },
  ];

  List<Map<String, String>> filteredMateri = [];

  @override
  void initState() {
    super.initState();
    filteredMateri = List.from(materiJS);

    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        filteredMateri = materiJS.where((materi) {
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
        title: Text('Materi JavaScript',
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
