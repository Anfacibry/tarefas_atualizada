import 'package:flutter/material.dart';
import 'package:tarefas/theme/layout/cores.dart';

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
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Cores.corSecundaria,
        ).copyWith(
          primary: Cores.corPincipal,
          secondary: Cores.corSecundaria,
        ),
        useMaterial3: true,
      ),
      home: const HomeTarefas(titulo: 'Flutter Demo Home Page'),
    );
  }
}

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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
