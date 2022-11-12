import 'package:cadastro_candidato_api/model/candidato.dart';
import 'package:flutter/material.dart';

class Components {
  returnAppBar(color, actionSearch, actionAdd, actionMore, text, colorButton,) {
    return AppBar(
      backgroundColor: color,
      title: returnText(text, 'Montserrat', Color.fromARGB(255, 3, 3, 3)),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.person),
            color: colorButton,
            onPressed: actionSearch),
        IconButton(
            icon: const Icon(Icons.zoom_out_sharp),
            color: colorButton,
            onPressed: actionAdd),
        IconButton(
            icon: const Icon(Icons.more_vert_sharp),
            color: colorButton,
            onPressed: actionMore),
      ],
    );
  }

  returnText(text, font, [color]) {
  if (color != null) {
    return Text(text,
        style: TextStyle(
          color: color,
          fontFamily: font
        ));
  }
}

 returnInput(text, controller, message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 30),
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return message;
          }
        },
      ),
    );
  }

returnButton(formController, action, title) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black
              ),
              onPressed: () {
                if (formController.currentState!.validate()) {
                  action();
                }
              },
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  criaItemPessoa(Candidato c, acaoEditar, acaoExcluir) {

    return ListTile(
      title: returnText("${c.nome}", 'Georgia'),
      subtitle: returnText("${c.cargo} ${c.partido}", 'Georgia'),
    );
  }
}


