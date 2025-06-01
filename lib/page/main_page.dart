import 'package:dev_santara/cubit/page_cubit.dart';
import 'package:dev_santara/page/home.dart';
import 'package:dev_santara/page/quiz_page.dart';
import 'package:dev_santara/widget/custom_button_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const Home();
      case 1:
        return const QuizPage();
      default:
        return const Home();
    }
  }

  Widget customButtonNavigation() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonNavigationItem(index: 0, icon: Icons.home, label: 'Home'),
            CustomButtonNavigationItem(index: 1, icon: Icons.quiz, label: 'Quiz'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: KBackgroundColor,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
