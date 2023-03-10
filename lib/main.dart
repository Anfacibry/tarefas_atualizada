import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:tarefas/theme/layout/cores.dart';

import 'screens/home_tarefa.dart';

void main() {
  runApp(const AppTarefa());
}

class AppTarefa extends StatelessWidget {
  const AppTarefa({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // excluindoBd();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("pt", "BR")],
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Cores.corFundo,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Cores.corSecundaria,
            foregroundColor: Cores.corCard,
          )),
      home: const HomeTarefas(titulo: 'Flutter Demo Home Page'),
    );
  }
}
