import 'package:flutter/material.dart';

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
      'title': 'Welcome',
      'desc': 'Explore app features easily',
    },
    {
      'title': 'Connect',
      'desc': 'Connect with your friends and community',
    },
    {
      'title': 'Enjoy',
      'desc': 'Enjoy the full experience',
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemCount: _onboardingData.length,
        itemBuilder: (context, index) {
          final data = _onboardingData[index];

          return Column(
            children: [
              // Container hitam setengah layar
              Container(
                width: double.infinity,
                height: screenHeight / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200)
                  ),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    data['title']!,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),

              // Sisanya isi deskripsi + tombol
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data['desc']!,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        onPressed: _nextPage,
                        child: Text(index == _onboardingData.length - 1 ? 'Get Started' : 'Next'),
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
