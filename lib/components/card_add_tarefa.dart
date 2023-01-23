import 'package:flutter/material.dart';

import '../theme/layout/cores.dart';

class CardAddTarefa extends StatelessWidget {
  const CardAddTarefa({super.key});

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
          children: const [
            TextField(
              decoration: InputDecoration(
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
            ),
            Padding(
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
          onPressed: () {},
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
          onPressed: () {},
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
