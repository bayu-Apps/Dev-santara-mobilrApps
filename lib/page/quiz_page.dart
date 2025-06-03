import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dev_santara/shared/theme.dart';
import 'package:dev_santara/page/quiz/quiz_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Map<String, bool> _completedQuizzes = {};

  final List<Map<String, String>> programmingQuizzes = [
    {'title': 'HTML', 'icon': 'assets/icon/html.png'},
    {'title': 'CSS', 'icon': 'assets/icon/css.png'},
    {'title': 'JAVASCRIPT', 'icon': 'assets/icon/js_icon.png'},
    {'title': 'PHP', 'icon': 'assets/icon/php_icon.png'},
    {'title': 'PYTHON', 'icon': 'assets/icon/python_icon.png'},
  ];

  final List<Map<String, String>> frameworkQuizzes = [
    {'title': 'ALL FRAMEWORKS', 'icon': 'assets/icon/allframeworks.png'},
    {'title': 'TAILWIND CSS', 'icon': 'assets/icon/tailwind.png'},
    {'title': 'FLUTTER', 'icon': 'assets/icon/flutter.png'},
    {'title': 'LARAVEL', 'icon': 'assets/icon/laravel.png'},
    {'title': 'REACT', 'icon': 'assets/icon/reactjs.png'},
    {'title': 'NEXT JS', 'icon': 'assets/icon/nectjs.png'},
  ];

  @override
  void initState() {
    super.initState();
    _ensureUser();
  }

  Future<void> _ensureUser() async {
    if (_auth.currentUser == null) {
      await _auth.signInAnonymously();
    }
    _loadCompletedQuizzes();
  }

  Future<void> _loadCompletedQuizzes() async {
    final userId = _auth.currentUser!.uid;
    final doc = await _firestore.collection('quiz_progress').doc(userId).get();
    final data = doc.data() ?? {};

    setState(() {
      for (var quiz in [...programmingQuizzes, ...frameworkQuizzes]) {
        final title = quiz['title']!;
        _completedQuizzes[title] = data[title] == true;
      }
    });
  }

  Future<void> _markQuizAsCompleted(String quizTitle) async {
    final userId = _auth.currentUser!.uid;
    await _firestore.collection('quiz_progress').doc(userId).set({
      quizTitle: true,
    }, SetOptions(merge: true));

    setState(() {
      _completedQuizzes[quizTitle] = true;
    });
  }

  void _openQuiz(BuildContext context, String category) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPages(category: category),
      ),
    );

    await _markQuizAsCompleted(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E3A8A),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 10, left: 25, right: 25),
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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quiz Bahasa Pemrograman',
                    style: WhiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                  ),
                  const SizedBox(height: 5),
                  Column(
                    children: programmingQuizzes.map((quiz) {
                      return _buildQuizCard(
                        context,
                        quiz['title']!,
                        quiz['icon']!,
                        _completedQuizzes[quiz['title']] ?? false,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Quiz Frameworks',
                    style: WhiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: frameworkQuizzes.map((quiz) {
                      return _buildQuizCard(
                        context,
                        quiz['title']!,
                        quiz['icon']!,
                        _completedQuizzes[quiz['title']] ?? false,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizCard(BuildContext context, String title, String iconPath, bool isCompleted) {
    return GestureDetector(
      onTap: () => _openQuiz(context, title),
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
            if (isCompleted)
              const Icon(Icons.check_circle, color: Colors.green, size: 30),
          ],
        ),
      ),
    );
  }
}
