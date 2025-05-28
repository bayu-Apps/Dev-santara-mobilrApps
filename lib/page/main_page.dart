import 'package:dev_santara/cubit/page_cubit.dart';
import 'package:dev_santara/page/home.dart';
import 'package:dev_santara/page/quiz_page.dart';
import 'package:dev_santara/page/setting_page.dart';
import 'package:dev_santara/widget/custom_button_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
// ignore: non_constant_identifier_names
  Widget BuildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Home();
        case 1:
        return QuizPage();
        case 2:
        return SettingPage();
      default:
      return Home();;
    }
  }

  const MainPage({super.key});

  Widget customButtonNavigation() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 60,
        margin: EdgeInsets.only(
          bottom: 0.5,
          left: DefaultMargin,
          right: DefaultMargin,
        ),
        decoration: BoxDecoration(
            color: KWhitecoloer, borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButtonNavigationItem(
              index: 0,
              imageUrl: 'assets/icon_home.png',
            ),
            CustomButtonNavigationItem(
              index: 1,
              imageUrl: 'assets/icon_booking.png',
            ),
            CustomButtonNavigationItem(
              index: 2,
              imageUrl: 'assets/icon_card.png',
            ),
            CustomButtonNavigationItem(
              index: 3,
              imageUrl: 'assets/icon_settings.png',
            ),
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
          body: Stack(
            children: [
              BuildContent(currentIndex),
              customButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
