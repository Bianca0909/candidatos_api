
import 'package:cadastro_candidato_api/pages/listagem.dart';
import 'package:cadastro_candidato_api/util/components.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtCargo = TextEditingController();
  TextEditingController txtPartido = TextEditingController();

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    cadastro() {
     Navigator.of(context).pushReplacementNamed('/cadastro');
    }

    consulta() {
     Navigator.of(context).pushReplacementNamed('/listagem');
    }

    return Scaffold(
      appBar: Components().returnAppBar(
          Colors.white, home, cadastro, consulta, "CADASTRO ELEITORAL", Colors.black),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Image.asset('../assets/img/images.png'),
            Components().returnButton(formController, cadastro, 'Registrar Candidato'),
            Components().returnButton(formController, consulta, 'Consultar candidatos')
          ],
        ),
      ),
    );
  }
}
