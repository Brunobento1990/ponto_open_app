import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ponto_open/configs/storage_keys.dart';
import 'package:ponto_open/storage/acess_storage.dart';

class HttpService {
  final String _urlApi = "http://localhost:5175/";
  final _timeout = const Duration(seconds: 30);

  Future<dynamic> post(
      {required String path, dynamic body, bool autentica = true}) async {
    try {
      final headers = await _getHeader(autentica);
      var response = await http
          .post(
            Uri.parse('$_urlApi$path'),
            headers: headers,
            body: body,
          )
          .timeout(_timeout);
      return json.decode(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, String>> _getHeader(bool autoriza) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    if (autoriza) {
      final empresaId =
          await AcessStorage.getStringStorage(StorageKeys.empresaId);
      final usuarioId =
          await AcessStorage.getStringStorage(StorageKeys.usuarioId);
      if (empresaId == null || usuarioId == null) {
        throw Exception("Não autorizado!");
      }
      headers.addAll({'EmpresaId': empresaId, 'UsuarioId': usuarioId});
    }

    return headers;
  }
}
