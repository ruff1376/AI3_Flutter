import 'package:flutter/material.dart';
import 'package:dio_board_app/screens/main_screen.dart';
import 'package:dio_board_app/screens/board/list_screen.dart';
import 'package:dio_board_app/screens/board/create_screen.dart';
import 'package:dio_board_app/screens/board/detail_screen.dart';
import 'package:dio_board_app/screens/board/update_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "http board app",
      initialRoute: '/main',
      routes: {
        '/main'         : (context) => const MainScreen(),
        '/board/list'   : (context) => const ListScreen(),
        '/board/create' : (context) => const CreateScreen(),
        '/board/detail' : (context) => const DetailScreen(),
        '/board/update' : (context) => const UpdateScreen(),
      },
    );
  }
}
