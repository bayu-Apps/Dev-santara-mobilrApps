import 'package:dev_santara/shared/theme.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _bannerImages = [
    'assets/banner1.png',
    'assets/banner1.png',
    'assets/banner1.png',
  ];

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

            // BANNER SLIDER
            SizedBox(
              height: 150,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: _bannerImages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          _bannerImages[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 8,
                    child: Row(
                      children: List.generate(_bannerImages.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 16 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),

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

            // LANGUAGE ITEM SCROLL
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildLanguageItem('HTML', 'assets/icon/html.png'),
                  _buildLanguageItem('CSS', 'assets/icon/css.png'),
                  _buildLanguageItem('JS', 'assets/icon/js_icon.png'),
                  _buildLanguageItem('PHP', 'assets/icon/php_icon.png'),
                  _buildLanguageItem('Python', 'assets/icon/python_icon.png'),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20, ),
              child: Column(
                children: [
                  Text('Belajar dengan project',
                  style: WhiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Image.asset('assets/BP1.png'),
                  SizedBox(width: 15,),
                  Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Landing Page',
                      style: BlackTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Html & Tailwind Css',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              
                ],
              ),
            ),
            SizedBox(height: 10,),


            //BP2
             Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Image.asset('assets/BP1.png'),
                  SizedBox(width: 15,),
                  Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Landing Page',
                      style: BlackTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Html & Tailwind Css',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              
                ],
              ),
            ),

            SizedBox(height: 10,),

             //BP3
             Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Image.asset('assets/BP1.png'),
                  SizedBox(width: 15,),
                  Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Landing Page',
                      style: BlackTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Html & Tailwind Css',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              
                ],
              ),
            ),

            SizedBox(height: 10,),


             //BP4
             Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Image.asset('assets/BP1.png'),
                  SizedBox(width: 15,),
                  Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Landing Page',
                      style: BlackTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Html & Tailwind Css',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              
                ],
              ),
            ),

            
          

          ],
        ),
      ),
      
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
        onPressed: () {
          context.read<NavigationCubit>().goToHome();
        },
        child: const Text('Home'),
            ),
            ElevatedButton(
        onPressed: () {
          context.read<NavigationCubit>().goToProfile();
        },
        child: const Text('Profile'),
            ),
            ElevatedButton(
        onPressed: () {
          context.read<NavigationCubit>().goToSettings();
        },
        child: const Text('Settings'),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildLanguageItem(String title, String iconPath) {
    final isHtml = title == 'HTML';
    final imageSize = isHtml ? 70.0 : 65.0;

    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: imageSize,
            height: imageSize,
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
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
