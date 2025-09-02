import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // ⭐ 데이터 전달 받기
    Map<String, dynamic>? data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // Text 공통 스타일
    TextStyle textStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Settings Screen'),
            Text('Received ID: ${data?["id"]}', style: textStyle),
            Text('Received Name: ${data?["name"]}', style: textStyle),
            Text('Received Content: ${data?["content"]}', style: textStyle),
          ],
        ),
      ),
    );
  }
}