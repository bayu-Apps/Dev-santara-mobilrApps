import 'dart:async';

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

  // Daftar quiz tetap dua list
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

  Map<String, Map<String, dynamic>> _completedQuizzes = {};
  StreamSubscription<DocumentSnapshot>? _quizProgressSubscription;

  @override
  void initState() {
    super.initState();
    _ensureUserAndListen();
  }

  @override
  void dispose() {
    // Pastikan listener dibatalkan saat widget di‐dispose
    _quizProgressSubscription?.cancel();
    super.dispose();
  }

  Future<void> _ensureUserAndListen() async {
    // 1) Pastikan user signed‐in
    if (_auth.currentUser == null) {
      await _auth.signInAnonymously();
    }

    final userId = _auth.currentUser!.uid;
    final docRef = _firestore.collection('quiz_progress').doc(userId);

    // 2) Daftarkan listener real‐time
    _quizProgressSubscription = docRef.snapshots().listen((snapshot) {
      final data = snapshot.data() ?? {};
      final Map<String, Map<String, dynamic>> temp = {};

      // Parsing programmingQuizzes
      for (var quiz in programmingQuizzes) {
        final title = quiz['title']!;
        final quizData = data[title];
        if (quizData is Map<String, dynamic>) {
          temp[title] = {
            'completed': quizData['completed'] == true,
            'score': quizData['score'] ?? 0,
          };
        } else {
          temp[title] = {
            'completed': false,
            'score': 0,
          };
        }
      }

      // Parsing frameworkQuizzes
      for (var quiz in frameworkQuizzes) {
        final title = quiz['title']!;
        final quizData = data[title];
        if (quizData is Map<String, dynamic>) {
          temp[title] = {
            'completed': quizData['completed'] == true,
            'score': quizData['score'] ?? 0,
          };
        } else {
          temp[title] = {
            'completed': false,
            'score': 0,
          };
        }
      }

      // 3) Update state ketika ada data baru
      setState(() {
        _completedQuizzes = temp;
      });
    });
  }

  Future<void> _markQuizAsCompleted(String quizTitle, int score) async {
    final userId = _auth.currentUser!.uid;
    await _firestore.collection('quiz_progress').doc(userId).set({
      quizTitle: {
        'completed': true,
        'score': score,
      },
    }, SetOptions(merge: true));
    // Tidak perlu setState di sini untuk skor, karena listener akan otomatis memicu setState
  }

  void _openQuiz(BuildContext context, String category) async {
    final int? score = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPages(category: category),
      ),
    );

    if (score != null) {
      await _markQuizAsCompleted(category, score);
      // Tidak perlu memanggil _loadCompletedQuizzes() ataupun setState di sini.
      // Karena listener sudah memantau dokumen Firestore secara real‐time.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E3A8A),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 10, left: 25, right: 25),
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
                      final quizData = _completedQuizzes[quiz['title']] ?? {'completed': false, 'score': 0};
                      return _buildQuizCard(
                        context,
                        quiz['title']!,
                        quiz['icon']!,
                        quizData,
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
                      final quizData = _completedQuizzes[quiz['title']] ?? {'completed': false, 'score': 0};
                      return _buildQuizCard(
                        context,
                        quiz['title']!,
                        quiz['icon']!,
                        quizData,
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

  Widget _buildQuizCard(
      BuildContext context, String title, String iconPath, Map<String, dynamic> quizData) {
    final bool isCompleted = quizData['completed'] ?? false;
    final int score = quizData['score'] ?? 0;
    Color checkColor;

    if (score >= 70) {
      checkColor = Colors.green;
    } else if (score >= 40) {
      checkColor = Colors.yellow;
    } else {
      checkColor = Colors.red;
    }

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
              Row(
                children: [
                   Text(
                    '$score / 100',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.check_circle, color: checkColor, size: 30),
                 
                ],
              ),
          ],
        ),
      ),
    );
  }
}
