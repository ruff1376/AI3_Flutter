
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_board_app/models/boards.dart';

class BoardService {
  
  // 데이터 목록
  Future<List<Map<String, dynamic>>> list() async {
    var url = "http://10.0.2.2:8080/boards";
    dynamic list;
    try {
      var response = await http.get(Uri.parse(url));
      print("::::: response - body :::::");
      print(response.body);
      // UTF-8 디코딩
      var utf8Decoded = utf8.decode(response.bodyBytes);
      // JSON 디코딩
      List<dynamic> jsonList = jsonDecode(utf8Decoded);
      // List<dynamic> ➡ List<Map<String, dynamic>>
      list = jsonList.map((item) => item as Map<String, dynamic>).toList();
    } catch (e) {
      print("Error: $e");
    }
    return list;
  }

  // 데이터 조회
  Future<Boards?> select(String id) async {
    var url = "http://10.0.2.2:8080/boards/$id";
    Boards? board;
    try {
      var response = await http.get(Uri.parse(url));
      print("::::: response - body :::::");
      print(response.body);
      // UTF-8 디코딩
      var utf8Decoded = utf8.decode(response.bodyBytes);
      // JSON 디코딩
      Map<String, dynamic> jsonMap = jsonDecode(utf8Decoded);
      board = Boards.fromMap(jsonMap);
    } catch (e) {
      print("Error: $e");
    }
    return board;
  }

  // 데이터 등록
  Future<int> create(Boards board) async {
    var url = "http://10.0.2.2:8080/boards";
    int result = 0;
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(board.toMap()),
      );
      print("::::: response - body :::::");
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print("게시글 등록 성공!");
        result = 1;
      } else {
        print("게시글 등록 실패!");
        result = 0;
      }
    } catch (e) {
      print("Error: $e");
    }
    return result;
  }

  // 데이터 수정
  Future<int> update(Boards board) async {
    var url = "http://10.0.2.2:8080/boards";
    int result = 0;
    try {
      var response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(board.toMap()),
      );
      print("::::: response - body :::::");
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 204 || response.statusCode == 200) {
        print("게시글 수정 성공!");
        result = 1;
      } else {
        print("게시글 수정 실패!");
        result = 0;
      }
    } catch (e) {
      print("Error: $e");
    }
    return result;
  }

  // 데이터 삭제
  Future<int> delete(String id) async {
    var url = "http://10.0.2.2:8080/boards/$id";
    int result = 0;
    try {
      var response = await http.delete(Uri.parse(url));
      print("::::: response - body :::::");
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 204 || response.statusCode == 200) {
        print("게시글 삭제 성공!");
        result = 1;
      } else {
        print("게시글 삭제 실패!");
        result = 0;
      }
    } catch (e) {
      print("Error: $e");
    }
    return result;
  }

}