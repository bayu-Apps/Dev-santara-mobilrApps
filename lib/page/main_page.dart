// lib/views/main_page.dart
import 'package:dev_santara/page/home.dart';
import 'package:dev_santara/widget/custom_button_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/page_cubit.dart';
import 'quiz_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          // Body: gunakan IndexedStack agar setiap halaman hanya dibangun sekali
          body: IndexedStack(
            index: currentIndex,
            children: const [
              Home(),     // index 0
              QuizPage(), // index 1
            ],
          ),

          // Custom Bottom Navigation Bar
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: const BoxDecoration(
             color: const Color(0xFF173155),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            
              children: const [
                CustomButtonNavigationItem(
                  index: 0,
                  icon: Icons.home_filled,
                  label: 'Home',
                ),
                CustomButtonNavigationItem(
                  index: 1,
                  icon: Icons.quiz_rounded,
                  label: 'Quiz',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
