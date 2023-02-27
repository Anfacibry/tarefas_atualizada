import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          child: FutureBuilder<List<Tarefa>>(
              future: listaTarefas(),
              builder: (ctx, snapshot) {
                final List<Tarefa>? lista = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Text("Caiu no none"),
                        ],
                      ),
                    );

                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Text("Caiu no waiting"),
                        ],
                      ),
                    );
                  case ConnectionState.active:
                    return Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Text("Caiu no active"),
                        ],
                      ),
                    );
                  case ConnectionState.done:
                    if (snapshot.hasData && lista != null) {
                      return ListView.builder(
                        itemCount: lista.length,
                        itemBuilder: (context, index) {
                          final Tarefa tarefa = lista[index];
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: largura * .04),
                            child: Card(
                              child: ListTile(
                                title: Text(tarefa.tarefa),
                                subtitle: Text(
                                  DateFormat(
                                    "dd 'de' MMMM 'de' yyyy 'às' hh'h':mm'm'",
                                    "pt_BR",
                                  ).format(tarefa.data),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text("Valores nulos"),
                      );
                    }
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
