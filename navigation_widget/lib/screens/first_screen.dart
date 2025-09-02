import 'package:flutter/material.dart';
import 'package:navigation_widget/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 화면 이동 방법 1 - 새로운 스크린을 쌓기
            // Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SecondScreen())
            // );

            // 화면 이동 방법 2 - pop + push 동시에
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen())
            );
          },
          child: Text("Go to Second Screen")
        ),
      ),
    );
  }
}