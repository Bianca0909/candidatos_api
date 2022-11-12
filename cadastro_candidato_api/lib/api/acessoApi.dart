import 'package:cadastro_candidato_api/model/candidato.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AcessoApi {
  Future<List<Candidato>> listaTodos() async {

    String url = "http://localhost:8080/candidato";
    Response resposta = await get(Uri.parse(url));
    String jsonUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonUtf8);
    List<Candidato> lista =
        List<Candidato>.from(l.map((e) => Candidato.fromJson(e)));
    return lista;
  }

 Future<List<Candidato>> buscarPorPartido(String partido) async {
    String url = "http://localhost:8080/candidato/$partido";
    Response resposta = await get(Uri.parse(url));
    String jsonUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonUtf8);
    List<Candidato> lista =
        List<Candidato>.from(l.map((e) => Candidato.fromJson(e)));
    return lista;
  }

  Future<void> insereCandidato(Map<String, dynamic> candidato) async {
    String url = "http://localhost:8080/candidato";
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    await post(Uri.parse(url), headers: headers, body: jsonEncode(candidato));
  }

  Future<void> alteraCandidato(Map<String, dynamic> candidato, int id) async {
    String url = "http://localhost:8080/candidato/$id";
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    await put(Uri.parse(url), headers: headers, body: jsonEncode(candidato));
  }

  Future<void> excluiCandidato(int id) async {
    String url = "http://localhost:8080/candidato/$id";
    await delete(Uri.parse(url));
  }
}
