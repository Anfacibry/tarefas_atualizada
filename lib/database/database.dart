import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tarefas/models/tarefa.dart';

String tabelaTarefa = "tarefa";
String id = "id";
String tituloTarefa = "tituloTarefa";
String data = "data";

Future<Database> database() async {
  final Future<Database> bancoDeDados = openDatabase(
    join(await getDatabasesPath(), '$tabelaTarefa.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE $tabelaTarefa($id INTEGER PRIMARY KEY, $tituloTarefa TEXT, $data TEXT)',
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
      id: maps[index][id],
      tarefa: maps[index][tituloTarefa],
      data: maps[index][data],
    ),
  );
}
