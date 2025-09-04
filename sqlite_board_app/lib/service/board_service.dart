import 'package:sqlite_board_app/database_helper.dart';
import 'package:sqlite_board_app/models/boards.dart';

class BoardService {
  
  // 데이터 목록
  Future<List<Map<String, dynamic>>> list() async {
    final db = await DatabaseHelper.instance.database;
    return await db.query('boards', orderBy: 'no DESC');
  }

  // 데이터 조회
  Future<Boards?> select(String id) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query('boards', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? Boards.fromMap(result.first) : null;
  }

  // 데이터 등록
  Future<int> create(Boards board) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('boards', board.toMap());
  }

  // 데이터 수정
  Future<int> update(Boards board) async {
    final db = await DatabaseHelper.instance.database;
    Map<String, dynamic> data = {
      'title': board.title,
      'writer': board.writer,
      'content': board.content,
      'updated_at': DateTime.now().toIso8601String(),
    };
    return await db.update('boards', data, where: 'id = ?', whereArgs: [board.id]);
  }

  // 데이터 삭제
  Future<int> delete(String id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete('boards', where: 'id = ?', whereArgs: [id]);
  }

}