import 'dart:async';
import 'package:dev_santara/page/home/project/crudlaravel11.dart';
import 'package:dev_santara/page/home/project/kalkulatorjs.dart';
import 'package:dev_santara/page/home/project/kalkulatorpy.dart';
import 'package:dev_santara/page/home/project/landingpage.dart';
import 'package:dev_santara/page/materi_page/CSSmateri.dart';
import 'package:dev_santara/page/materi_page/HTMLMateri.dart';
import 'package:dev_santara/page/materi_page/JSmateri.dart';
import 'package:dev_santara/page/materi_page/PHPmateri.dart';
import 'package:dev_santara/page/materi_page/Pythonmateri.dart';
import 'package:dev_santara/utils/shared_prefs.dart';
import 'package:dev_santara/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:dev_santara/shared/theme.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  final User? user = FirebaseAuth.instance.currentUser;

  int _currentPage = 0;
  bool showProfile = false;
  Timer? _timer;

  final List<String> _bannerImages = [
    'assets/slider1.jpg',
    'assets/slider2.jpg',
    'assets/slider3.jpg',
  ];

  // Daftar bahasa pemrograman dan navigasi terkait
  final List<Map<String, dynamic>> _languages = [
    {
      'title': 'HTML',
      'iconPath': 'assets/icon/html.png',
      'page': () => const Htmlmateri(),
    },
    {
      'title': 'CSS',
      'iconPath': 'assets/icon/css.png',
      'page': () => const Cssmateri(),
    },
    {
      'title': 'JS',
      'iconPath': 'assets/icon/js_icon.png',
      'page': () => const JavascriptMateri(),
    },
    {
      'title': 'PHP',
      'iconPath': 'assets/icon/php_icon.png',
      'page': () => const PHPMateri(),
    },
    {
      'title': 'Python',
      'iconPath': 'assets/icon/python_icon.png',
      'page': () => const PythonMateri(),
    },
  ];

  final List<Map<String, dynamic>> _projectList = [
    {
      'image': 'assets/icon/landingpage.png',
      'title': 'Landing Page',
      'description': 'HTML & Tailwind CSS',
      'page': const Landingpage(),
    },
    {
      'image': 'assets/icon/crudlaravel11.jpeg',
      'title': 'CRUD dengan Laravel 11',
      'description': 'Laravel 11',
      'page': const Crudlaravel11(),
    },
    {
      'image': 'assets/icon/kalkulatorhtmlcssjs.jpeg',
      'title': 'Kalkulator Javascript',
      'description': 'JavaScript Project',
      'page': const Kalkulatorjs(),
    },
    {
      'image': 'assets/icon/kalkulatorpython.jpeg',
      'title': 'Kalkulator Python',
      'description': 'Python Project',
      'page': const Kalkulatorpy(),
    },
  ];

  // List hasil filter untuk bahasa & project
  List<Map<String, dynamic>> _filteredLanguages = [];
  List<Map<String, dynamic>> _filteredProjects = [];

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _filteredProjects = _projectList;
    _filteredLanguages = _languages;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPage < _bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _searchItems(String query) {
    setState(() {
      _searchQuery = query;
      if (_searchQuery.isEmpty) {
        _filteredProjects = _projectList;
        _filteredLanguages = _languages;
      } else {
        _filteredProjects = _projectList.where((project) {
          return project['title'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
        }).toList();
        _filteredLanguages = _languages.where((lang) {
          return lang['title'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool inSearchMode = _searchQuery.isNotEmpty;

    return Scaffold(
      backgroundColor: const Color(0xff1E3A8A),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx < -10) {
            setState(() {
              showProfile = true;
            });
          }
          if (details.delta.dx > 10) {
            setState(() {
              showProfile = false;
            });
          }
        },
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView( 
                child: Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.only(top: 25, bottom: 100, left: 30, right: 30,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SEARCH & PROFILE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icon/search_icon.png',
                                    width: 28,
                                    height: 28,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      onChanged: (value) {
                                        _searchItems(value);
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Cari proyek atau bahasa pemrograman...',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showProfile = !showProfile;
                              });
                            },
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage: user?.photoURL != null
                                  ? NetworkImage(user!.photoURL!)
                                  : null,
                              backgroundColor: Colors.blueAccent,
                              child: user?.photoURL == null
                                  ? const Icon(Icons.person,
                                      size: 24, color: Colors.white)
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                    
                      if (!inSearchMode) ...[
                        // BANNER
                        SizedBox(
                          height: 200,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              PageView.builder(
                                controller: _pageController,
                                itemCount: _bannerImages.length,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      _bannerImages[index],
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                bottom: 8,
                                child: Row(
                                  children: List.generate(
                                      _bannerImages.length, (index) {
                                    return AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      width: _currentPage == index ? 16 : 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: _currentPage == index
                                            ? Colors.white
                                            : Colors.white54,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // LANGUAGE
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _languages.map((lang) {
                              final isHtml = lang['title'] == 'HTML';
                              final imageSize = isHtml ? 70.0 : 65.0;

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              lang['page']()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: imageSize,
                                        height: imageSize,
                                        child: Image.asset(
                                          lang['iconPath'],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        lang['title'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: medium),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // SECTION TITLE
                        Text(
                          'Belajar dengan project',
                          style: WhiteTextStyle.copyWith(
                              fontSize: 18, fontWeight: medium),
                        ),
                        const SizedBox(height: 15),
                      ],

                      if (inSearchMode) ...[
                        // Tampilkan bahasa pemrograman hasil cari
                        if (_filteredLanguages.isNotEmpty) ...[
                          Text(
                            'Bahasa Pemrograman',
                            style: WhiteTextStyle.copyWith(
                                fontSize: 18, fontWeight: medium),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: _filteredLanguages.map((lang) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => lang['page']()));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 70,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.asset(
                                            lang['iconPath'],
                                            width: 70,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                          child: Text(
                                            lang['title'],
                                            style:
                                                BlackTextStyle.copyWith(fontSize: 18),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                        ],

                        // Tampilkan project hasil cari
                        if (_filteredProjects.isNotEmpty) ...[
                          Text(
                            'Project',
                            style: WhiteTextStyle.copyWith(
                                fontSize: 18, fontWeight: medium),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: _filteredProjects.map((project) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: _buildProjectCard(
                                  project['image'],
                                  project['title'],
                                  project['description'],
                                  project['page'],
                                ),
                              );
                            }).toList(),
                          ),
                        ],

                        // Jika tidak ada hasil sama sekali
                        if (_filteredLanguages.isEmpty && _filteredProjects.isEmpty) ...[
                          Center(
                            child: Text(
                              'Tidak ada hasil pencarian',
                              style: WhiteTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ],

                      // Jika tidak dalam mode pencarian, tampilkan daftar project seperti semula
                      if (!inSearchMode)
                        Column(
                          children: _filteredProjects.map((project) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: _buildProjectCard(
                                project['image'],
                                project['title'],
                                project['description'],
                                project['page'],
                              ),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            // SLIDE INDICATOR
            if (!showProfile)
              Positioned(
                right: 5,
                top: MediaQuery.of(context).size.height / 2 - 20,
                child: const Opacity(
                  opacity: 1,
                  child:
                      Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 24),
                ),
              ),

            // PROFILE PANEL
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              right: showProfile ? 0 : -MediaQuery.of(context).size.width * 0.75,
              top: 0,
              bottom: 0,
              width: MediaQuery.of(context).size.width * 0.75,
              child: const ProfilePanel(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(
      String imagePath, String title, String description, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Container(
        width: double.infinity,
        height: 70,
        padding: const EdgeInsets.all(10),
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child:
                  Image.asset(imagePath, width: 70, height: 50, fit: BoxFit.cover),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: BlackTextStyle.copyWith(fontSize: 18)),
                  Text(description, style: greyTextStyle.copyWith(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageItem(String title, String iconPath, VoidCallback onTap) {
    final isHtml = title == 'HTML';
    final imageSize = isHtml ? 70.0 : 65.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              width: imageSize,
              height: imageSize,
              child: Image.asset(iconPath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: medium),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePanel extends StatefulWidget {
  const ProfilePanel({super.key});

  @override
  State<ProfilePanel> createState() => _ProfilePanelState();
}

class _ProfilePanelState extends State<ProfilePanel> {
  final User? user = FirebaseAuth.instance.currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    await SharedPrefs.clearAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: user?.photoURL != null
                  ? NetworkImage(user!.photoURL!)
                  : null,
              backgroundColor: Colors.blueAccent,
              child: user?.photoURL == null
                  ? const Icon(Icons.person, size: 50, color: Colors.white)
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              user?.displayName ?? 'Nama tidak tersedia',
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              user?.email ?? 'Email tidak tersedia',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                final shouldLogout = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Konfirmasi Logout"),
                      content: const Text("Apakah Anda yakin ingin logout?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false); // Tidak logout
                          },
                          child: const Text("Batal"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true); // Lanjut logout
                          },
                          child: const Text("Logout"),
                        ),
                      ],
                    );
                  },
                );

                if (shouldLogout == true) {
                  await logout();
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(context, '/Register');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
