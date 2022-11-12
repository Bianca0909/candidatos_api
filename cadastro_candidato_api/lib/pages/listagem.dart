import 'package:cadastro_candidato_api/api/acessoApi.dart';
import 'package:cadastro_candidato_api/model/candidato.dart';
import 'package:cadastro_candidato_api/util/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Listagem extends StatefulWidget {
  const Listagem({super.key});

  @override
  State<Listagem> createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
  List<Candidato> lista = [];

  listaCandidatos() async {
    List<Candidato> candidatos = await AcessoApi().listaTodos();
    setState(() {
      lista = candidatos;
    });
  }

  @override
  void initState() {
    listaCandidatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    criaItemCandidato(Candidato c, context) {
      return ListTile(
        title: Text('${c.id} - ${c.nome}'),
        subtitle: Text('${c.cargo} (${c.partido})'),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/cadastro",
                      arguments: c
                    );
                  }),
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await AcessoApi().excluiCandidato(c.id);
                    listaCandidatos();
                  }),
            ],
          ),
        ),
      );
    }

    irTelaCadastro() {
      Navigator.pushNamed(
        context,
        "/cadastrar",
        arguments: Candidato(0, "", "", ""),
      );
    }

    buscarPorPartido() {
     
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, indice) {
          return Card(
            elevation: 6,
            margin: const EdgeInsets.all(3),
            child: criaItemCandidato(lista[indice], context),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: irTelaCadastro,
        child: const Icon(Icons.add),
      ),
    );
  }
}
