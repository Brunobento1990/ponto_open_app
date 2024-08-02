import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ponto_open/widgets/snack_bar_widget.dart';

class LocalizacaoAdapter {
  Future<Position?> getLocalizacao(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      SnackBarCustom.open(
          context: context,
          mesage: 'Ative a localização do seu celular.',
          erro: true);
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        SnackBarCustom.open(
            context: context,
            mesage: 'Você deve aceitar o acesso à localização.',
            erro: true);
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      SnackBarCustom.open(
          context: context,
          mesage:
              'Permissão negada permanentemente. Habilite manualmente nas configurações do dispositivo.',
          erro: true);
      return null;
    }

    // Permissão concedida, obter a localização atual
    return await Geolocator.getCurrentPosition();
  }
}
