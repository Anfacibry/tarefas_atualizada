class Tarefa {
  int id;
  String tarefa;
  DateTime data;
  bool isFeito;
  Tarefa({
    required this.id,
    required this.tarefa,
    required this.data,
    required this.isFeito,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": tarefa,
        "data": data.toIso8601String(),
        "feito": isFeito == true ? 1 : 0,
      };
  @override
  String toString() {
    return "Id pego: $id, tarefa: $tarefa, data: ${data.toString()}, feito: $isFeito";
  }
}
