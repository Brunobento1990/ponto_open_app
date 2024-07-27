import 'package:flutter/material.dart';
import 'package:ponto_open/library/adapters/http_adapter.dart';
import 'package:ponto_open/library/models/usuario.dart';

class LoginApi {
  static Future<Usuario?> login(
      {required String usuarioId,
      required String empresaId,
      required BuildContext context}) async {
    var response = await HttpService().post(
        path: 'login/usuario',
        body: {
          'chaveDeAcessoUsuario': int.parse(usuarioId),
          'chaveDeAcessoEmpresa': int.parse(empresaId)
        },
        autentica: false,
        context: context);

    if (response == null) {
      return null;
    }

    return Usuario.fromJson(response);
  }
}
