import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SafeareaWidget extends StatelessWidget {
  const SafeareaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 상태바, 네비게이션바 숨기기
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    return SafeArea(
      // 안전영역 사용여부
      // - top, bottom, left, right : 안전영역 사용방향 지정
      top: true,
      bottom: true,
      left: true,
      right: true,
      minimum: const EdgeInsets.all(10),
      child: Container(
        height: 1000,
        color: Colors.blue,
      )
    );
  }
}