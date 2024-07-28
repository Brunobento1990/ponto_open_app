import 'package:flutter/material.dart';
import 'package:ponto_open/library/adapters/localizacao_adapter.dart';
import 'package:ponto_open/widgets/button_widget.dart';
import 'package:ponto_open/widgets/scafold_widget.dart';
import 'package:ponto_open/widgets/text_widget.dart';

class BaterPontoPage extends StatefulWidget {
  const BaterPontoPage({super.key});

  @override
  State<BaterPontoPage> createState() => _BaterPontoPageState();
}

class _BaterPontoPageState extends State<BaterPontoPage> {
  final DateTime data = DateTime.now();
  final LocalizacaoAdapter localizacao = LocalizacaoAdapter();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final result = await localizacao.getLocalizacao();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return ScafoldWidgetCustom(
      children: Center(
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextCustom(
                  text: 'Confirme o horário: ${data.hour}:${data.minute}',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                ButtonCustom(
                  onPressed: () {},
                  text: 'Confirmar',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
