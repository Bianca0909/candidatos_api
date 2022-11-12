import 'package:cadastro_candidato_api/pages/listagem.dart';
import 'package:cadastro_candidato_api/pages/home.dart';
import 'package:cadastro_candidato_api/pages/cadastro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home':(context) => const Home(),
        '/cadastro': (context) => const Cadastro(),
        '/listagem': (context) => const Listagem(),
        
      },
    );
  }
}