import 'dart:math';

import 'package:flutter/material.dart';

import 'package:tarefas/database/database.dart';

import 'package:tarefas/models/tarefa.dart';

import '../theme/layout/cores.dart';

class CardAddTarefa extends StatelessWidget {
  CardAddTarefa({super.key});

  final TextEditingController controllerTarefa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double altura = MediaQuery.of(context).size.height;
    final double largura = MediaQuery.of(context).size.width;
    return AlertDialog(
      contentPadding: const EdgeInsets.all(30),
      backgroundColor: Cores.corCard,
      title: const Text(
        "Digite o seu item",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: altura * .2,
        width: largura * .8,
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Digite sua tarefa",
                hintText: "Tarefa",
                fillColor: Cores.corFundoCaixaTextoBotaoCancelar,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              cursorColor: Cores.corTextoSecundario,
              cursorWidth: 3,
              controller: controllerTarefa,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Os itens adicionados ficarão disponiveis na tela inicial!",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Cores.corFundoCaixaTextoBotaoCancelar,
          ),
          child: const Text(
            "Cancelar",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            inserindoTarefa(
              Tarefa(
                id: Random().nextInt(100),
                tarefa: controllerTarefa.text,
                data: DateTime.now(),
                isFeito: false,
              ),
            );

            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Cores.corPincipal,
          ),
          child: const Text(
            "Adicionar",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
