import 'package:flutter/material.dart';
import 'package:dev_santara/shared/theme.dart';
import 'package:dev_santara/page/quiz/quiz_page.dart';


class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  void _openQuiz(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPages(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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

              // Quiz Cards Bahasa Pemrograman
              Column(
                children: [
                  _buildQuizCard(context, 'HTML', 'assets/icon/html.png'),
                  _buildQuizCard(context, 'CSS', 'assets/icon/css.png'),
                  _buildQuizCard(context, 'JAVASCRIPT', 'assets/icon/js_icon.png'),
                  _buildQuizCard(context, 'PHP', 'assets/icon/php_icon.png'),
                  _buildQuizCard(context, 'PYTHON', 'assets/icon/python_icon.png'),
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
                    _buildFrameworkItem(context, 'ALL FRAMEWORKS', 'assets/icon/allframeworks.png'),
                    const SizedBox(width: 15),
                    _buildFrameworkItem(context, 'TAILWIND CSS', 'assets/icon/tailwind.png'),
                    const SizedBox(width: 15),
                    _buildFrameworkItem(context, 'FLUTTER', 'assets/icon/flutter.png'),
                    const SizedBox(width: 15),
                    _buildFrameworkItem(context, 'LARAVEL', 'assets/icon/laravel.png'),
                    const SizedBox(width: 15),
                    _buildFrameworkItem(context, 'REACT', 'assets/icon/reactjs.png'),
                    const SizedBox(width: 15),
                    _buildFrameworkItem(context, 'NEXT JS', 'assets/icon/nectjs.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuizCard(BuildContext context, String title, String iconPath) {
    return GestureDetector(
      onTap: () => _openQuiz(context, title.toUpperCase()),
      child: Container(
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
      ),
    );
  }

  Widget _buildFrameworkItem(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () => _openQuiz(context, title.toUpperCase()),
      child: Column(
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
      ),
    );
  }
}