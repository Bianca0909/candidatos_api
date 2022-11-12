import 'package:cadastro_candidato_api/api/acessoApi.dart';
import 'package:cadastro_candidato_api/model/candidato.dart';
import 'package:cadastro_candidato_api/util/components.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtCargo = TextEditingController();
  TextEditingController txtPartido = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Candidato;
    txtNome.text = args.nome;
    txtCargo.text = args.cargo;
    txtPartido.text = args.partido;

    salvar() async {
      Candidato c =
          Candidato(args.id, txtNome.text, txtCargo.text, txtPartido.text);
      if (c.id == 0) {
        await AcessoApi().insereCandidato(c.toJson());
      } else {
        await AcessoApi().alteraCandidato(c.toJson(), c.id);
      }
      Navigator.of(context).pushNamed('/listagem');
    }

    return Scaffold(
      body: Form(
        key: formController,
        child: Column(
          children: [
            Components().returnInput("Nome", txtNome, "Nome"),
            Components().returnInput("Cargo", txtCargo, "Cargo"),
            Components().returnInput("Partido", txtPartido, "Partido"),
            Components().returnButton(formController, salvar, "Salvar")
          ],
        ),
      ),
    );
  }
}
