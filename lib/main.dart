import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/login/login.dart';
import 'package:primeiro_projeto_flutter/pages/cadastro.dart';
import 'package:primeiro_projeto_flutter/pages/home.dart';
import 'package:primeiro_projeto_flutter/pages/perfil.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/pages/home': (context) => Home(), // Correção aqui
        '/pages/cadastro': (context) => Cadastro(), // Correção aqui
        '/pages/perfil': (context) => Perfil(), // Correção aqui
      },
    );
  }
}
