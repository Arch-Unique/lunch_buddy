import '../model/note.dart';

abstract class DBService {
  Future<Note> insert(Note note);
  Future<int> delete(int id);
  Future<int> update(Note note);
  Future<Note> get(int id);
  Future<List<Note>> getAll();
}
