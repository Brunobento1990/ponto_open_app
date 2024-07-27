import 'dart:convert';

class Empresa {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String razaoSocial;
  String nomeFantasia;
  String cnpj;

  Empresa({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.cnpj,
  });

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      razaoSocial: json['razaoSocial'],
      nomeFantasia: json['nomeFantasia'],
      cnpj: json['cnpj'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'razaoSocial': razaoSocial,
      'nomeFantasia': nomeFantasia,
      'cnpj': cnpj,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
