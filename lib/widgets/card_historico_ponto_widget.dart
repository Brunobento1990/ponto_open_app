import 'package:flutter/material.dart';
import 'package:ponto_open/library/models/ponto.dart';
import 'package:ponto_open/widgets/text_widget.dart';

class CardHistoricoPontoWidget extends StatefulWidget {
  final Ponto ponto;
  final int index;
  const CardHistoricoPontoWidget(
      {super.key, required this.ponto, required this.index});

  @override
  State<CardHistoricoPontoWidget> createState() =>
      _CardHistoricoPontoWidgetState();
}

class _CardHistoricoPontoWidgetState extends State<CardHistoricoPontoWidget> {
  @override
  Widget build(BuildContext context) {
    final bool isEntrada = widget.index / 2 == 0;
    final Color color = isEntrada ? Colors.green : Colors.red;
    return SizedBox(
      width: 90,
      height: 70,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, size: 15, color: color),
                  TextCustom(
                    text: widget.ponto.horario,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
            TextCustom(
              text: isEntrada ? 'Entrada' : 'Saída',
              fontSize: 12,
              color: color,
            )
          ],
        ),
      ),
    );
  }
}
