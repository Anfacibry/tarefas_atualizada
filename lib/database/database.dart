import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tarefas/models/tarefa.dart';

String tarefaDb = "tarefa";
String tabelaTarefa = "tabelaTarefa";
String id = "id";
String titulo = "titulo";
String data = "data";

Future<Database> database() async {
  final Future<Database> bancoDeDados = openDatabase(
    join(await getDatabasesPath(), '$tarefaDb.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE $tabelaTarefa($id INTEGER PRIMARY KEY, $titulo TEXT, $data TEXT)',
      );
    },
    version: 1,
  );

  return bancoDeDados;
}

Future<void> inserindoTarefa(Tarefa tarefa) async {
  try {
    final Database bancoDeDados = await database();
    await bancoDeDados.insert(
      tabelaTarefa,
      tarefa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint("Pegando data: ${tarefa.data}");
  } catch (erro) {
    debugPrint(erro.toString());
    return;
  }
}

Future<void> excluindoBd() async {
  Database db = await database();
  await db.delete(tabelaTarefa);
}

Future<List<Tarefa>> listaTarefas() async {
  try {
    final Database bancoDeDados = await database();

    final List<Map<String, dynamic>> maps =
        await bancoDeDados.query(tabelaTarefa);
    debugPrint(maps.toString());
    debugPrint("Data: ${maps[0][data].runtimeType.toString()}");
    debugPrint("Titulo: ${maps[0][titulo].runtimeType.toString()}");
    return List.generate(
      maps.length,
      (index) => Tarefa(
        id: maps[index][id],
        tarefa: maps[index][titulo],
        data: DateTime.parse(maps[index][data]),
      ),
    );
  } catch (erro) {
    debugPrint(erro.toString());
    return List.empty();
  }
}
