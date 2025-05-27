import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E3A8A),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // USER PROFILE
            Row(
              children: [
                Image.asset('assets/icon/user-profile.png'),
                const SizedBox(width: 15),
                Text(
                  'Your Username',
                  style: WhiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // BANNER
            Image.asset('assets/banner1.png'),

            const SizedBox(height: 20),

            // SEARCH BAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon/search_icon.png',
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // SCROLLABLE LIST OF LANGUAGES
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildLanguageItem('HTML', 'assets/icon/logo_html.png'),
                  _buildLanguageItem('CSS', 'assets/icon/css_icon.png'),
                  _buildLanguageItem('JS', 'assets/icon/js_icon.png'),
                  _buildLanguageItem('PHP', 'assets/icon/php_icon.png'),
                  _buildLanguageItem('Python', 'assets/icon/python_icon.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageItem(String title, String iconPath,) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          SizedBox(
            width: 65,
            height: 65,
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain, // memastikan gambar tidak terpotong
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
