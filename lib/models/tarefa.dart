class Tarefa {
  int id;
  String tarefa;
  DateTime data;
  Tarefa({
    required this.id,
    required this.tarefa,
    required this.data,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": tarefa,
        "data": data.toIso8601String(),
      };
  @override
  String toString() {
    return "Id pego: $id, tarefa: $tarefa, data: ${data.toString()}";
  }
}
