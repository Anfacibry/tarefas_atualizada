import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tarefas/models/tarefa.dart';

String tarefaDb = "tarefa";
String tabelaTarefa = "tabelaTarefa";
String id = "id";
String titulo = "titulo";
String data = "data";
String isFeito = "feito";

Future<Database> database() async {
  final Future<Database> bancoDeDados = openDatabase(
    join(await getDatabasesPath(), '$tarefaDb.db'),
    onCreate: (db, version) {
      return db.execute(
        '''CREATE TABLE $tabelaTarefa(
          $id INTEGER PRIMARY KEY, 
          $titulo TEXT, 
          $data TEXT, 
          $isFeito INTEGER
          )''',
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
    debugPrint("Pegando data: ${tarefa.toMap()}");
  } catch (erro) {
    debugPrint("Erro pego: ${erro.toString()}");
    debugPrint("Verificando: ${tarefa.toMap()}");
    return;
  }
}

Future<void> excluindoTarefa(int id) async {
  Database db = await database();
  await db.delete(
    tabelaTarefa,
    where: "id = ?",
    whereArgs: [id],
  );
}

Future<void> atualizandoTarefa(Tarefa tarefa) async {
  final db = await database();

  db.update(
    tabelaTarefa,
    tarefa.toMap(),
    where: "id = ?",
    whereArgs: [tarefa.id],
  );
}

Future<List<Tarefa>> listaTarefas() async {
  try {
    final Database bancoDeDados = await database();

    final List<Map<String, dynamic>> maps =
        await bancoDeDados.query(tabelaTarefa);
    debugPrint("Lista pega da Lista de Tarefas: ${maps.toString()}");
    return List.generate(
      maps.length,
      (index) => Tarefa(
        id: maps[index][id],
        tarefa: maps[index][titulo],
        data: DateTime.parse(maps[index][data]),
        isFeito: maps[index][isFeito] == 1,
      ),
    );
  } catch (erro) {
    return List.empty();
  }
}
