import 'package:ponto_open/library/adapters/http_adapter.dart';
import 'package:ponto_open/library/models/ponto.dart';

class HomeApi {
  final api = HttpService();
  Future<List<Ponto>> getUltimosPontos() async {
    var pontos = <Ponto>[];
    final response = await api.get(path: 'ponto/ultimos-pontos');
    if (response == null) return pontos;
    if (response.runtimeType != List) pontos;
    for (var resp in response) {
      pontos.add(Ponto.fromJson(resp));
    }

    return pontos;
  }
}
