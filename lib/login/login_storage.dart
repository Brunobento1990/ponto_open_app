import 'package:ponto_open/library/adapters/storage_adapter.dart';
import 'package:ponto_open/library/configs/storage_keys.dart';
import 'package:ponto_open/library/models/usuario.dart';

class LoginStorage {
  static Future<void> login(
      {required Usuario usuario,
      required String empresaId,
      required String usuarioId}) async {
    await StorageAdapter.setStringStorage(
        StorageKeys.empresa, usuario.empresa.toString());
    await StorageAdapter.setStringStorage(
        StorageKeys.usuario, usuario.toString());
    await StorageAdapter.setStringStorage(StorageKeys.empresaId, empresaId);
    await StorageAdapter.setStringStorage(StorageKeys.usuarioId, usuarioId);
  }
}
