import 'package:get/get.dart';
import 'package:launch_buddy/src/global/interfaces/note_service.dart';
import 'package:launch_buddy/src/global/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NoteService extends GetxService implements DBService {
  late Database db;
  String tableNote = "joyjokesdb";

  Future open() async {
    String dbpath = await getDatabasesPath();
    String path = "$dbpath/joyjokesdb.db";
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableNote ( 
  id integer primary key autoincrement, 
  title text not null,
  content text not null,
  time text not null,
  color integer not null)
''');
    });
  }

  @override
  Future<int> delete(int id) async {
    return await db.delete(tableNote, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<Note> get(int id) async {
    List<Map<String, dynamic>> maps = await db.query(tableNote,
        columns: ["id", "title", "content", "time", "color"],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    }
    return Note(title: "", content: "");
  }

  @override
  Future<List<Note>> getAll() async {
    List<Map<String, dynamic>> maps = await db
        .query(tableNote, columns: ["id", "title", "content", "time", "color"]);
    if (maps.isNotEmpty) {
      return List.generate(maps.length, (i) {
        return Note.fromMap(maps[i]);
      });
    }
    return [];
  }

  @override
  Future<Note> insert(Note note) async {
    note.id = await db.insert(tableNote, note.toMap());
    return note;
  }

  @override
  Future<int> update(Note note) async {
    return await db
        .update(tableNote, note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }
}
