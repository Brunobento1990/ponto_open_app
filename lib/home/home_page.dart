import 'package:flutter/material.dart';
import 'package:ponto_open/home/home_api.dart';
import 'package:ponto_open/library/models/ponto.dart';
import 'package:ponto_open/library/utils/convert.dart';
import 'package:ponto_open/widgets/card_bater_ponto_widget.dart';
import 'package:ponto_open/widgets/card_historico_ponto_widget.dart';
import 'package:ponto_open/widgets/header_widget.dart';
import 'package:ponto_open/widgets/menu_widget.dart';
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const HeaderWidget(),
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  pontos.isNotEmpty
                      ? TextCustom(
                          text:
                              'Do dia: ${Convert.convertDataFromJson(pontos[0].createdAt)}')
                      : SizedBox.fromSize(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
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
                ],
              ),
            ),
            const CardBaterPontoWidget(),
            const MenuWidget(),
          ],
        ),
      ),
    );
  }
}
