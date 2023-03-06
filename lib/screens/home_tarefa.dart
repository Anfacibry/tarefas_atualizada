import 'package:flutter/material.dart';

import 'package:tarefas/components/card_add_tarefa.dart';
import 'package:tarefas/components/container_de_tarefas.dart';
import 'package:tarefas/database/database.dart';
import 'package:tarefas/models/tarefa.dart';
import 'package:tarefas/theme/layout/cores.dart';

class HomeTarefas extends StatefulWidget {
  final String titulo;
  const HomeTarefas({required this.titulo, Key? key}) : super(key: key);

  @override
  State<HomeTarefas> createState() => _HomeTarefasState();
}

class _HomeTarefasState extends State<HomeTarefas> {
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
                    if (snapshot.hasData && lista != null && lista.isNotEmpty) {
                      return ListView.builder(
                        itemCount: lista.length,
                        clipBehavior: Clip.none,
                        itemBuilder: (context, index) {
                          final Tarefa tarefa = lista[index];

                          return InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (cntx) => AlertDialog(
                                  content: Text(
                                    tarefa.tarefa,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Editar",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Cores.corTextoSecundario,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text("Ok",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Cores.corPincipal,
                                          )),
                                    ),
                                  ],
                                  actionsAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                              );
                            },
                            child: ContainerDeTarefas(
                              tarefa: tarefa,
                              fun: () {
                                setState(() {
                                  excluindoTarefa(tarefa.id);
                                });
                              },
                              funConfirmar: () {
                                setState(() {
                                  atualizandoTarefa(Tarefa(
                                    id: tarefa.id,
                                    tarefa: tarefa.tarefa,
                                    data: tarefa.data,
                                    isFeito: !tarefa.isFeito,
                                  ));
                                });
                              },
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text("Sua lista de tarefas está vazia"),
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
