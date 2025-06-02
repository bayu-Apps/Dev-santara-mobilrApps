import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PythonMateri extends StatefulWidget {
  const PythonMateri({super.key});

  @override
  State<PythonMateri> createState() => _PythonMateriState();
}

class _PythonMateriState extends State<PythonMateri> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> materiPython = [
    {
      "judul": "1. Apa itu Python?",
      "isi":
          "Python adalah bahasa pemrograman yang mudah dipelajari dan digunakan untuk berbagai aplikasi, termasuk pengembangan web, analisis data, dan kecerdasan buatan.",
      "kode": "print('Halo Dunia!')",
      "link": "https://www.w3schools.com/python/python_intro.asp"
    },
    {
      "judul": "2. Variabel di Python",
      "isi":
          "Gunakan nama variabel tanpa tanda khusus untuk mendeklarasikan variabel.",
      "kode":
          "nama = 'Bayu'\numur = 17\naktif = True",
      "link": "https://www.w3schools.com/python/python_variables.asp"
    },
    {
      "judul": "3. Fungsi di Python",
      "isi":
          "Fungsi dapat dideklarasikan menggunakan kata kunci def.",
      "kode":
          "def tambah(a, b):\n    return a + b",
      "link": "https://www.w3schools.com/python/python_functions.asp"
    },
    {
      "judul": "4. Kondisional if-else",
      "isi":
          "Gunakan if, elif, dan else untuk membuat keputusan berdasarkan kondisi.",
      "kode":
          "nilai = 80\nif nilai >= 90:\n    print('A')\nelif nilai >= 75:\n    print('B')\nelse:\n    print('C')",
      "link": "https://www.w3schools.com/python/python_conditions.asp"
    },
    {
      "judul": "5. Looping di Python",
      "isi":
          "Gunakan for dan while untuk pengulangan.",
      "kode":
          "for i in range(5):\n    print(i)",
      "link": "https://www.w3schools.com/python/python_for_loops.asp"
    },
    {
      "judul": "6. List di Python",
      "isi":
          "List digunakan untuk menyimpan banyak nilai dalam satu variabel.",
      "kode":
          "buah = ['apel', 'jeruk', 'pisang']\nprint(buah[1])  # jeruk",
      "link": "https://www.w3schools.com/python/python_lists.asp"
    },
    {
      "judul": "7. Dictionary di Python",
      "isi":
          "Dictionary menyimpan data dalam format key-value.",
      "kode":
          "orang = {'nama': 'Bayu', 'umur': 17}\nprint(orang['nama'])",
      "link": "https://www.w3schools.com/python/python_dictionaries.asp"
    },
    {
      "judul": "8. Event Handling",
      "isi":
          "Python tidak menangani event di sisi klien, tetapi dapat digunakan dalam aplikasi GUI untuk menangani event.",
      "kode":
          "# Contoh menggunakan Tkinter\nimport tkinter as tk\n\ndef on_click():\n    print('Tombol diklik!')\n\nroot = tk.Tk()\nbutton = tk.Button(root, text='Klik Saya', command=on_click)\nbutton.pack()\nroot.mainloop()",
      "link": "https://www.w3schools.com/python/python_gui_tkinter.asp"
    },
    {
      "judul": "9. Manipulasi String di Python",
      "isi":
          "Python dapat digunakan untuk memanipulasi string dengan mudah.",
      "kode":
          "judul = 'Judul Baru'\nprint(judul)",
      "link": "https://www.w3schools.com/python/python_strings.asp"
    },
    {
      "judul": "10. Menggunakan Requests untuk HTTP Requests",
      "isi":
          "Digunakan untuk menangani operasi HTTP.",
      "kode":
          "import requests\n\nresponse = requests.get('https://api.example.com/data')\nprint(response.json())",
      "link": "https://www.w3schools.com/python/python_requests.asp"
    },
  ];

  List<Map<String, String>> filteredMateri = [];

  @override
  void initState() {
    super.initState();
    filteredMateri = List.from(materiPython);

    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        filteredMateri = materiPython.where((materi) {
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
        title: Text('Materi Python',
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