import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ponto_open/library/adapters/storage_adapter.dart';
import 'package:ponto_open/library/configs/storage_keys.dart';
import 'package:ponto_open/widgets/snack_bar_widget.dart';

class HttpService {
  final String _urlApi = "https://app.api.open-adm.tech/";
  final _timeout = const Duration(seconds: 30);

  Future<dynamic> post(
      {required String path,
      dynamic body,
      bool autentica = true,
      BuildContext? context}) async {
    try {
      final headers = await _getHeader(autentica);
      var response = await http
          .post(
            Uri.parse('$_urlApi$path'),
            headers: headers,
            body: jsonEncode(body),
          )
          .timeout(_timeout);
      // ignore: use_build_context_synchronously
      return _handleResponseApi(response, context);
    } catch (e) {
      if (context != null) {
        SnackBarCustom.open(
            context: context,
            mesage: 'Ocorreu um erro interno, tente novamente!',
            erro: true);
      }
      return null;
    }
  }

  Future<dynamic> get(
      {required String path,
      bool autentica = true,
      BuildContext? context}) async {
    try {
      final headers = await _getHeader(autentica);
      var response = await http
          .get(
            Uri.parse('$_urlApi$path'),
            headers: headers,
          )
          .timeout(_timeout);
      // ignore: use_build_context_synchronously
      return _handleResponseApi(response, context);
    } catch (e) {
      if (context != null) {
        SnackBarCustom.open(
            context: context,
            mesage: 'Ocorreu um erro interno, tente novamente!',
            erro: true);
      }
      return null;
    }
  }

  _handleResponseApi(http.Response response, BuildContext? context) {
    final body = json.decode(response.body);
    if (context != null) {
      if (response.statusCode != 200 && response.statusCode != 201) {
        SnackBarCustom.open(
            context: context, mesage: body['error'], erro: true);
        return null;
      }
    }

    return body;
  }

  Future<Map<String, String>> _getHeader(bool autoriza) async {
    var headers = {'Content-Type': 'application/json'};

    if (autoriza) {
      final empresaId =
          await StorageAdapter.getStringStorage(StorageKeys.empresaId);
      final usuarioId =
          await StorageAdapter.getStringStorage(StorageKeys.usuarioId);
      if (empresaId == null || usuarioId == null) {
        throw Exception("Não autorizado!");
      }
      headers.addAll({
        'ChaveDeAcessoEmpresa': empresaId,
        'ChaveDeAcessoUsuario': usuarioId
      });
    }

    return headers;
  }
}
