class BancoDeDados {
  int id;
  String nome;
  double value;
  BancoDeDados(this.id, this.nome, this.value);
  Map<String, dynamic> tomap() {
    var map = <String, dynamic>{'id': id, 'nome': nome, 'value': value};
    return map;
  }

  BancoDeDados.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    nome = map["nome"];
    value = map["value"];
  }
}
