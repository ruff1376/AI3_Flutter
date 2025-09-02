import 'package:flutter/material.dart';
import 'package:navigation_widget/models/profile.dart';

class HomeScreen extends StatelessWidget {
  final data;
  const HomeScreen({super.key, this.data = 'default'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("홈 화면"),),
      body: Center(
        child: Text("홈 화면 : $data", style: TextStyle(fontSize: 32),),
      ),
      bottomSheet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 프로필 버튼
            ElevatedButton(
              onPressed: () {
                // 라우팅 경로로 화면 이동
                // Navigator.pushNamed(context, "/profile");

                // ⭐ 화면 이동하며 데이터 전달하기
                // * argument : 전달할 데이터 지정
                // Navigator.pushNamed(context, "/profile", arguments: "user");
                Profile profile = Profile(
                  id: "1001",
                  name: "Aloha",
                  email: "aloha@example.com"
                );
                Navigator.pushNamed(
                  context, "/profile",
                  arguments: profile
                );
              },
              child: Text("프로필")
            ),
            // 설정 버튼
            ElevatedButton(
              onPressed: () {
                // 라우팅 경로로 화면 이동
                Navigator.pushNamed(
                  context, "/settings",
                  // ⭐ Map을 사용해서 
                  arguments: {
                    "id"          : 1001,
                    "name"        : "Aloha",
                    "content"     : "Hello, world!"
                  }
                );
              },
              child: Text("설정")
            ),
          ],
        ),
      ),
    );
  }
}