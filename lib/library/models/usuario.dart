import 'dart:convert';

import 'package:ponto_open/library/models/empresa.dart';

class Usuario {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String nome;
  String cpf;
  String email;
  Empresa empresa;

  Usuario({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.empresa,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      nome: json['nome'],
      cpf: json['cpf'],
      email: json['email'],
      empresa: Empresa.fromJson(json['empresa']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'empresa': empresa.toJson(),
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}