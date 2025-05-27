import 'package:flutter/material.dart';
import 'package:dev_santara/shared/theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'images': 'assets/blob1.png',
      'title': 'Belajar Coding Itu Menyenangkan!',
      'describe': 'Mulailah perjalanan Anda ke dunia pemrograman dengan cara yang menyenangkan dan interaktif.'
    },
    {
      'images': 'assets/blob2.png',
      'title': 'Praktik Langsung, Bukan Hanya Teori',
      'describe': 'Setiap pelajaran menyertakan contoh nyata sehingga Anda dapat langsung memahaminya dan menerapkannya.'
    },
    {
      'images': 'assets/blob3.png',
      'title': 'Siap Menjadi Programmer Hebat?',
      'describe': 'Kuasai keterampilan pengkodean dari dasar hingga tingkat lanjut dan ubah impian teknologi Anda menjadi kenyataan.'
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.pushReplacementNamed(context, '/Register');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff1E3A8A),
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemCount: _onboardingData.length,
        itemBuilder: (context, index) {
          final data = _onboardingData[index];

          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 140),
                width: 309,
                height: 338,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data['images'] ?? ''),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        data['title'] ?? "",
                        style: WhiteTextStyle.copyWith(
                          fontSize: 32,
                          fontWeight: bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        data['describe'] ?? "",
                        style: WhiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          index == _onboardingData.length - 1 ? 'Get Started' : 'Next',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
