
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:dio_board_app/models/boards.dart';

class BoardService {
  
  // 데이터 목록
  Future<List<Map<String, dynamic>>> list() async {
    Dio dio = Dio();
    var url = "http://10.0.2.2:8080/boards";
    dynamic list;
    try {
      var response = await dio.get(url);
      print("::::: response - body :::::");
      print(response.data);
      list = (response.data as List)
              .map((e) => e as Map<String, dynamic>)
              .toList();
    } catch (e) {
      print("Error: $e");
    }
    return list;
  }

  // 데이터 조회
  Future<Boards?> select(String id) async {
    Dio dio = Dio();
    var url = "http://10.0.2.2:8080/boards/$id";
    Boards? board;
    try {
      var response = await dio.get(url);
      print("::::: response - body :::::");
      print(response.data);
      board = Boards.fromMap(response.data);
    } catch (e) {
      print("Error: $e");
    }
    return board;
  }

  // 데이터 등록
  Future<int> create(Boards board) async {
    Dio dio = Dio();
    var url = "http://10.0.2.2:8080/boards";
    int result = 0;
    try {
      var response = await dio.post(
        url,
        data: board.toMap(),
      );
      print("::::: response - body :::::");
      print(response.data);
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
    Dio dio = Dio();
    var url = "http://10.0.2.2:8080/boards";
    int result = 0;
    try {
      var response = await dio.put(
        url,
        data: board.toMap(),
      );
      print("::::: response - body :::::");
      print(response.data);
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
    Dio dio = Dio();
    var url = "http://10.0.2.2:8080/boards/$id";
    int result = 0;
    try {
      var response = await dio.delete(url);
      print("::::: response - body :::::");
      print(response.data);
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