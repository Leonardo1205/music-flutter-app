import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/musica_viewmodel.dart';
import 'views/lista_musicas_screen.dart';
import 'theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MusicaViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Músicas',
      theme: appTheme,
      home: ListaMusicasScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
