import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_dummyjson/model/login_model.dart';
import 'package:flutter_login_dummyjson/screen/blank_screen.dart';
import 'package:flutter_login_dummyjson/widgets/home_widget.dart';
import 'package:flutter_login_dummyjson/screen/search_screen.dart';

class NavigationScreen extends StatefulWidget {
  final LoginModel? myLoginModel;
  const NavigationScreen({super.key, required this.myLoginModel});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final _pageController = PageController();

  int _currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          _currentIndex = value;
          if (mounted) {
            setState(() {});
          }
        },
        children: [
          HomeWidget(loginModel: widget.myLoginModel),
          const SearchScreen(),
          const BlankScreen(),
          const BlankScreen(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.transparent,
        elevation: 30,
        child: CurvedNavigationBar(
          height: 65,
          items: [
            Icon(
              Icons.home_outlined,
              size: 35,
              color: _currentIndex == 0 ? Colors.white : Colors.black26,
            ),
            Icon(
              Icons.search_outlined,
              size: 35,
              color: _currentIndex == 1 ? Colors.white : Colors.black26,
            ),
            Icon(
              Icons.shopping_cart_outlined,
              size: 35,
              color: _currentIndex == 2 ? Colors.white : Colors.black26,
            ),
            Icon(
              Icons.notifications_outlined,
              size: 35,
              color: _currentIndex == 3 ? Colors.white : Colors.black26,
            )
          ],
          index: _currentIndex,
          color: Colors.white,
          buttonBackgroundColor: const Color.fromARGB(255, 223, 52, 94),
          backgroundColor: Colors.transparent,
          onTap: (index) {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);

            if (mounted) {
              setState(() {});
            }
            setState(() {});
          },
        ),
      ),
    );
  }
}
