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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80), 
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    'Quiz Bahasa Pemrograman',
                    style: WhiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 15),

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

                  // Section: Quiz Frameworks
                  Text(
                    'Quiz Frameworks',
                    style: WhiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 15),

                  Column(
                    children: [
                      _buildQuizCard(context, 'ALL FRAMEWORKS', 'assets/icon/allframeworks.png'),
                      _buildQuizCard(context, 'TAILWIND CSS', 'assets/icon/tailwind.png'),
                      _buildQuizCard(context, 'FLUTTER', 'assets/icon/flutter.png'),
                      _buildQuizCard(context, 'LARAVEL', 'assets/icon/laravel.png'),
                      _buildQuizCard(context, 'REACT', 'assets/icon/reactjs.png'),
                      _buildQuizCard(context, 'NEXT JS', 'assets/icon/nectjs.png'),
                    ],
                  ),
                ],
              ),
            ),
          ),

        
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            color: const Color(0xff1E3A8A),
            alignment: Alignment.centerLeft,
            child: Row(
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
          ),
        ],
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
}
