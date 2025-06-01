import 'package:flutter/material.dart';
import 'package:dev_santara/shared/theme.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff1E3A8A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Image.asset('assets/icon/logo_quiz.png'),
                  const SizedBox(width: 15),
                  Text(
                    'Quiz and Challenge',
                    style: WhiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                'Quiz Bahasa Pemrograman',
                style: WhiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),

              const SizedBox(height: 15),

              // Quiz Cards
              Column(
                children: [
                  _buildQuizCard('HTML', 'assets/icon/html.png'),
                  _buildQuizCard('CSS', 'assets/icon/css.png'),
                  _buildQuizCard('JAVASCRIPT', 'assets/icon/js_icon.png'),
                  _buildQuizCard('PHP', 'assets/icon/php_icon.png'),
                  _buildQuizCard('PYTHON', 'assets/icon/python_icon.png'),
                ],
              ),

              const SizedBox(height: 20),

              // Quiz Framework Section
              Text(
                'Quiz Frameworks',
                style: WhiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),

              const SizedBox(height: 15),

              // Horizontal Scrollable Frameworks
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFrameworkItem('ALL FRAMEWORKS', 'assets/icon/allframeworks.png'),
                    const SizedBox(width: 15),
                    _buildFrameworkItem('TAILWIND CSS', 'assets/icon/tailwind.png'),
                    const SizedBox(width: 15),
                    _buildFrameworkItem('FLUTTER', 'assets/icon/flutter.png'),
                    const SizedBox(width: 15),
                    _buildFrameworkItem('LARAVEL', 'assets/icon/laravel.png'),
                    const SizedBox(width: 15),
                    _buildFrameworkItem('REACT', 'assets/icon/reactjs.png'),
                    const SizedBox(width: 15),
                    _buildFrameworkItem('NEXT JS', 'assets/icon/nectjs.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Quiz Card Widget
  Widget _buildQuizCard(String title, String iconPath) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 40, height: 40),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: BlackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Framework Item (scrollable)
  Widget _buildFrameworkItem(String title, String imagePath) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 85,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: WhiteTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
