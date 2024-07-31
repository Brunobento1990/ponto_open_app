import 'package:flutter/material.dart';
import 'package:ponto_open/library/adapters/localizacao_adapter.dart';
import 'package:ponto_open/library/dtos/response_localizacao_dto.dart';
import 'package:ponto_open/ponto/ponto_api.dart';
import 'package:ponto_open/widgets/button_widget.dart';
import 'package:ponto_open/widgets/loading_widget.dart';
import 'package:ponto_open/widgets/scafold_widget.dart';
import 'package:ponto_open/widgets/text_widget.dart';

class BaterPontoPage extends StatefulWidget {
  const BaterPontoPage({super.key});

  @override
  State<BaterPontoPage> createState() => _BaterPontoPageState();
}

class _BaterPontoPageState extends State<BaterPontoPage> {
  final DateTime data = DateTime.now();
  final pontoApi = PontoApi();
  bool erroResponseLocalizacao = false;
  final LocalizacaoAdapter localizacao = LocalizacaoAdapter();
  ResponseLocalizacaoDto? responseLocalizacao;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final result = await localizacao.getLocalizacao();
    if (mounted) {
      final responseLocalizacaoResult = await pontoApi.getLocation(
          result.latitude.toString(), result.longitude.toString(), context);
      setState(() {
        responseLocalizacao = responseLocalizacaoResult;
        erroResponseLocalizacao = responseLocalizacaoResult == null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (erroResponseLocalizacao) {
      return ScafoldWidgetCustom(
        children: Center(
          child: SizedBox(
            width: double.infinity,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const TextCustom(
                        text:
                            'Não foi possível acessar sua localização, entre em contato com seu RH.',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ButtonCustom(
                        onPressed: () {},
                        text: 'Voltar',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return ScafoldWidgetCustom(
      children: Center(
        child: SizedBox(
          width: double.infinity,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const TextCustom(
                      text: 'Confirme o horário e o endereço',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    TextCustom(
                      text: '${data.hour}:${data.minute}',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    responseLocalizacao == null
                        ? const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextCustom(
                                text: 'Carregando endereço...',
                              ),
                              LoadingCustom(
                                withMessage: false,
                              ),
                            ],
                          )
                        : TextCustom(
                            text: responseLocalizacao?.endereco ?? '',
                            fontSize: 16,
                          ),
                    ButtonCustom(
                      onPressed: () {},
                      text: 'Confirmar',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
