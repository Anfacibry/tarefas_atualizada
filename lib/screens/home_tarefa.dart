import 'package:flutter/material.dart';
import 'package:tarefas/components/card_add_tarefa.dart';

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
        child: Padding(
          padding: EdgeInsets.all(largura * .1),
          child: Column(
            children: const [
              Spacer(),
              Text(
                "Lista vazia",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (contextAletDialogo) => const CardAddTarefa());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
