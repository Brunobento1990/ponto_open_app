import 'package:flutter/material.dart';
import 'package:ponto_open/library/adapters/http_adapter.dart';
import 'package:ponto_open/library/dtos/response_localizacao_dto.dart';

class PontoApi {
  final _api = HttpService();
  Future<ResponseLocalizacaoDto?> getLocation(
      String latitude, String longitude, BuildContext? context) async {
    final response = await _api.post(
      path: 'localizacao',
      body: {'latitude': latitude, 'longitude': longitude},
      context: context,
    );

    if (response == null) return null;

    return ResponseLocalizacaoDto.fromJson(response);
  }
}
