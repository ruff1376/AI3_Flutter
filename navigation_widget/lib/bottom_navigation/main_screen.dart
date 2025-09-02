import 'package:flutter/material.dart';
import 'package:navigation_widget/bottom_navigation/product_screen.dart';
import 'package:navigation_widget/bottom_navigation/user_screen.dart';
import 'package:navigation_widget/routes/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // 선택된 화면
  Widget _selectedScreen = HomeScreen();
  // 선택된 화면 index
  int _selectedIndex = 0;

  // bottomNavigation 탭 콜백함수
  void _onTab(int index) {
    print("화면을 이동합니다, ${index}");
    // ⭐ setState()
    // : StatefulWidget에서 변경된 state를 반영하여 UI를 업데이트하는 함수
    setState(() {
      _selectedIndex = index;
      switch(index) {
        // ⭐ 생성자를 통해 데이터 전달
        case 0: _selectedScreen = HomeScreen(data: 'home',); break;
        case 1: _selectedScreen = ProductScreen(); break;
        case 2: _selectedScreen = UserScreen(); break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}