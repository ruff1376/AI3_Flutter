import 'package:flutter/material.dart';
import 'package:layout_widget/models/product.dart';
import 'package:layout_widget/screens/detail_screen.dart';
import 'package:layout_widget/screens/gridview_screen.dart';
import 'package:layout_widget/screens/listview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '레이아웃 위젯',
      home:
      //   DetailScreen(product: Product(
      //   image: "image/image.jpg",
      //   title: "상품 제목 테스트",
      //   description: "상품 설명 테스트"
      // )),
      // ListviewScreen(),
      GridviewScreen()
    );
  }
}
