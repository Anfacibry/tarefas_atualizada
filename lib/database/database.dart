import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tarefas/models/tarefa.dart';

String tabelaTarefa = "tarefa";

Future<Database> database() async {
  final Future<Database> bancoDeDados = openDatabase(
    join(await getDatabasesPath(), 'tarefa.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE $tabelaTarefa(id INTEGER PRIMARY KEY, tarefa TEXT, data TEXT)',
      );
    },
    version: 1,
  );

  return bancoDeDados;
}

Future<void> inserindoTarefa(Tarefa tarefa) async {
  final Database bancoDeDados = await database();
  await bancoDeDados.insert(
    tabelaTarefa,
    tarefa.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Tarefa>> listaTarefas() async {
  final Database bancoDeDados = await database();

  final List<Map<String, dynamic>> maps =
      await bancoDeDados.query(tabelaTarefa);

  return List.generate(
    maps.length,
    (index) => Tarefa(
      id: maps[index]["id"],
      tarefa: maps[index]["tarefa"],
      data: maps[index]["data"],
    ),
  );
}
