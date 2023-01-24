import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> database() async {
  final Future<Database> db = openDatabase(
    join(await getDatabasesPath(), 'tarefa.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE tarefa(id INTEGER PRIMARY KEY, tarefa TEXT, data TEXT)',
      );
    },
    version: 1,
  );

  return db;
}
