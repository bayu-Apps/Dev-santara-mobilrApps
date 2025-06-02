import 'dart:async';
import 'package:flutter/material.dart';
import 'quiz_data.dart';

class QuizPages extends StatefulWidget {
  const QuizPages({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPages> {
  late List<Question> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _timeRemaining = 15;
  Timer? _timer;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _questions = questionsByCategory[widget.category] ?? [];
    _startTimer();
  }

  void _startTimer() {
    _timeRemaining = 15;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining <= 0) {
        _showTimeUpMessage();
        _nextQuestion();
      } else {
        setState(() {
          _timeRemaining--;
        });
      }
    });
  }


  

  void _showTimeUpMessage() {
    setState(() {
      _score -= 10; // Mengurangi 10 poin saat waktu habis
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Anda kehilangan 10 poin')),
    );
  }

  void _nextQuestion() {
    _timer?.cancel();
    setState(() {
      _answered = false;
      _selectedOptionIndex = null;
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _timeRemaining = 15;
        _startTimer();
      } else {
        _showScoreDialog();
      }
    });
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Skor Akhir', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text('Skor kamu: $_score dari ${_questions.length * 10}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetQuiz();
            },
            child: const Text('Ulangi'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _currentQuestionIndex = 0;
      _timeRemaining = 15;
      _answered = false;
      _selectedOptionIndex = null;
    });
    _startTimer();
  }

  int? _selectedOptionIndex;

  void _selectOption(int index) {
    if (_answered) return;
    setState(() {
      _selectedOptionIndex = index;
      _answered = true;
    });

    if (index == _questions[_currentQuestionIndex].correctIndex) {
      _score += 10;
    }

    Future.delayed(const Duration(seconds: 1), () {
      _nextQuestion();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildOption(int index) {
    final option = _questions[_currentQuestionIndex].options[index];
    final isSelected = _selectedOptionIndex == index;
    final correctIndex = _questions[_currentQuestionIndex].correctIndex;

    Color? optionColor;

    if (_answered) {
      if (index == correctIndex) {
        optionColor = Colors.greenAccent.shade700;
      } else if (isSelected && index != correctIndex) {
        optionColor = Colors.redAccent.shade700;
      } else {
        optionColor = Colors.grey.shade200;
      }
    } else {
      optionColor = Colors.grey.shade200;
    }

    return GestureDetector(
      onTap: () => _selectOption(index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: optionColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade400,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Text(
          option,
          style: TextStyle(
            fontSize: 18,
            color: _answered && optionColor == Colors.redAccent.shade700
                ? Colors.white
                : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Quiz - ${widget.category}'),
          backgroundColor: const Color(0xFF1E3A8A),
        ),
        body: Center(
          child: Text('Belum ada soal untuk kategori ini',
              style: const TextStyle(fontSize: 20)),
        ),
      );
    }

    final question = _questions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / _questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - ${widget.category}'),
        backgroundColor: const Color(0xFF1E3A8A),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade300,
            color: Colors.blueAccent,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF1E3A8A), // Background color
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Timer and progress row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pertanyaan ${_currentQuestionIndex + 1} / ${_questions.length}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.timer, color: Colors.redAccent),
                      const SizedBox(width: 4),
                      Text(
                        '$_timeRemaining s',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Question card
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 8,
                shadowColor: Colors.blue.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    question.question,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Options list
              Expanded(
                child: ListView.builder(
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    return _buildOption(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}