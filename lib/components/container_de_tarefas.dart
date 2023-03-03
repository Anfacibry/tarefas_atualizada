import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:tarefas/models/tarefa.dart';

import '../theme/layout/cores.dart';

class ContainerDeTarefas extends StatelessWidget {
  final Tarefa tarefa;
  final void Function() fun;
  final void Function() funConfirmar;
  const ContainerDeTarefas({
    required this.funConfirmar,
    required this.tarefa,
    required this.fun,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double altura = MediaQuery.of(context).size.height;
    final double largura = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: largura * .02,
        right: largura * .02,
        bottom: largura * .01,
      ),
      child: SizedBox(
        height: altura * .09,
        width: largura,
        child: LayoutBuilder(
          builder: (cntx, constraints) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    color: tarefa.isFeito ? Cores.corSecundaria : Cores.corCard,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: LayoutBuilder(
                    builder: (cntx, constraints) => Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .8,
                          child: ListTile(
                            title: Text(
                                tarefa.tarefa.length <= 20
                                    ? tarefa.tarefa
                                    : "${tarefa.tarefa.characters.take(20)}..."
                                        .toString(),
                                style: TextStyle(
                                  color: tarefa.isFeito
                                      ? Cores.corFundo
                                      : Cores.corTextoSecundario,
                                )),
                            subtitle: Text(
                              DateFormat(
                                "dd 'de' MMMM 'de' yyyy 'às' hh'h':mm'm'",
                                "pt_BR",
                              ).format(tarefa.data),
                              style: TextStyle(
                                color: tarefa.isFeito
                                    ? Cores.corFundo
                                    : Cores.corTextoSecundario,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: funConfirmar,
                            child: Icon(
                              Icons.check_circle,
                              color: tarefa.isFeito
                                  ? Cores.corFundo
                                  : Cores.corTextoSecundario,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: constraints.maxWidth * .02),
                ),
                InkWell(
                  onTap: fun,
                  child: Container(
                    height: constraints.maxHeight * .9,
                    width: constraints.maxWidth * .2,
                    decoration: BoxDecoration(
                      color: Cores.corBotaoDeletar,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
