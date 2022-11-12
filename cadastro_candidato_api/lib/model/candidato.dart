class Candidato {
  int id;
  String nome;
  String cargo;
  String partido;

  Candidato(this.id, this.nome, this.cargo, this.partido);

  factory Candidato.fromJson(dynamic json) {  // Json para objeto
    return Candidato(
        json["id"] as int, json["nome"] as String, json["cargo"] as String, json["partido"] as String);
  }

  Map<String, dynamic> toJson() => // Mapeamento para Json
      {if (id != 0) 'id': id, 'nome': nome, 'cargo': cargo, 'partido': partido};
}