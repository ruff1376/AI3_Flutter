import 'package:flutter/material.dart';
import 'package:navigation_widget/bottom_navigation/main_screen.dart';
import 'package:navigation_widget/routes/home_screen.dart';
import 'package:navigation_widget/routes/profile_screen.dart';
import 'package:navigation_widget/routes/settings_screen.dart';
import 'package:navigation_widget/screens/first_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: FirstScreen()
      // Routes 설정
      initialRoute: '/main',
      routes: {
        '/main'       : (context) => MainScreen(),
        '/home'       : (context) => HomeScreen(),
        '/profile'    : (context) => ProfileScreen(),
        '/settings'   : (context) => SettingsScreen(),
      },
    );
  }
}
