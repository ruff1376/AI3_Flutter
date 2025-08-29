import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// stf : StatefulWidget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 🧊 state
  String _menu = '점메추';
  final _menuList = ['짜장면', '짬뽕', '볶음밥', '닭갈비', '돈까스'];

  void _random() {
    final r = Random().nextInt(_menuList.length);
    // State Update
    setState(() {
      _menu = _menuList[r];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text('My App'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        body: Center(
          child: Text(
                  _menu,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent
                  ),
              )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _random();
          },
          child: const Icon(Icons.restaurant), 
        ),
      ),
    );
  }
}

// stl : StatelessWidget
// class MyApp extends StatelessWidget {
//   // 생성자
//   const MyApp({super.key});

//   // 메소드 오버라이딩
//   // build 메소드
//   // : 위젯 트리를 반환
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
//           title: const Text('My App'),
//           actions: [
//             IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
//           ],
//         ),
//         body: const Center(
//           child: Text('Hello World!')
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_bag),
//               label: 'Cart',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: 'Settings',
//             ),
//           ]
//         ),
//       ),
//     );
//   }
// }
