import 'package:flutter/material.dart';
import 'package:tarefas/components/card_add_tarefa.dart';
import 'package:tarefas/database/database.dart';
import 'package:tarefas/models/tarefa.dart';

class HomeTarefas extends StatelessWidget {
  final String titulo;
  const HomeTarefas({required this.titulo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double altura = MediaQuery.of(context).size.height;
    final double largura = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lista de tarefas",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: altura,
        width: largura,
        child: Center(
          child: FutureBuilder(
              future: listaTarefas(),
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  final lista = snapshot.data;
                  return ListView(
                    children: lista!
                        .map(
                          (tarefa) => Card(
                            child: ListTile(
                              title: Text(tarefa.tarefa),
                              trailing: Text(
                                tarefa.data.toString(),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return const Text("Lista Vazia");
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (contextAletDialogo) => CardAddTarefa());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
