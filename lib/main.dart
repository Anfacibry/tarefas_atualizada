import 'package:flutter/material.dart';
import 'package:tarefas/theme/layout/cores.dart';

import 'screens/home_tarefa.dart';

void main() {
  runApp(const Tarefas());
}

class Tarefas extends StatelessWidget {
  const Tarefas({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        scaffoldBackgroundColor: Cores.corFundo,
      ),
      home: const HomeTarefas(titulo: 'Flutter Demo Home Page'),
    );
  }
}
