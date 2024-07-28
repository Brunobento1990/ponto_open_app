class Ponto {
  final String horario;
  final String usuarioId;
  final String id;
  final DateTime createdAt;

  Ponto({
    required this.horario,
    required this.usuarioId,
    required this.id,
    required this.createdAt,
  });

  factory Ponto.fromJson(Map<String, dynamic> json) {
    return Ponto(
      horario: json['horario'] as String,
      usuarioId: json['usuarioId'] as String,
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'horario': horario,
      'usuarioId': usuarioId,
      'id': id,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}