import 'package:flutter/material.dart';
import 'package:sqlite_board_app/database_helper.dart';
import 'package:sqlite_board_app/screens/board/create_screen.dart';
import 'package:sqlite_board_app/screens/board/detail_screen.dart';
import 'package:sqlite_board_app/screens/board/list_screen.dart';
import 'package:sqlite_board_app/screens/board/update_screen.dart';
import 'package:sqlite_board_app/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Flutter 프레임워크 초기화

  // 데이터베이스 초기화 호출
  try {
    await DatabaseHelper.instance.database;
    print('데이터베이스 초기화 성공!');
  } catch (e) {
    print('데이터베이스 초기화 실패: $e');
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SQLite Board App",
      debugShowCheckedModeBanner: false,
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
