import 'package:flutter/material.dart';
import 'package:ponto_open/home/home_api.dart';
import 'package:ponto_open/library/models/ponto.dart';
import 'package:ponto_open/widgets/card_bater_ponto_widget.dart';
import 'package:ponto_open/widgets/card_historico_ponto_widget.dart';
import 'package:ponto_open/widgets/header_widget.dart';
import 'package:ponto_open/widgets/scafold_widget.dart';
import 'package:ponto_open/widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Ponto> pontos = [];
  final HomeApi api = HomeApi();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final result = await api.getUltimosPontos();
    setState(() {
      pontos = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScafoldWidgetCustom(
      children: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const HeaderWidget(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextCustom(
                      text: 'Últimos registros',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 90,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => CardHistoricoPontoWidget(
                  ponto: pontos[index],
                  index: index,
                ),
                itemCount: pontos.length,
              ),
            ),
            const CardBaterPontoWidget(),
          ],
        ),
      ),
    );
  }
}
