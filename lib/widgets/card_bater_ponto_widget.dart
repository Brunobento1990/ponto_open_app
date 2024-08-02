import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ponto_open/library/configs/theme.dart';
import 'package:ponto_open/widgets/button_widget.dart';
import 'package:ponto_open/widgets/text_widget.dart';

class CardBaterPontoWidget extends StatefulWidget {
  const CardBaterPontoWidget({super.key});

  @override
  State<CardBaterPontoWidget> createState() => _CardBaterPontoWidgetState();
}

class _CardBaterPontoWidgetState extends State<CardBaterPontoWidget> {
  DateTime _dataAtual = DateTime.now();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _inicializar();
    });
  }

  _inicializar() async {
    Timer.periodic(const Duration(seconds: 1), (_) {
      _setTimer();
    });
  }

  _setTimer() {
    setState(() {
      _dataAtual = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time,
                  color: ThemeApp.primary,
                ),
                const SizedBox(
                  width: 15,
                ),
                TextCustom(
                  text:
                      '${_dataAtual.hour.toString().padLeft(2, '0')}:${_dataAtual.minute.toString().padLeft(2, '0')}:${_dataAtual.second.toString().padLeft(2, '0')} | ${_dataAtual.day.toString().padLeft(2, '0')}/${_dataAtual.month.toString().padLeft(2, '0')}/${_dataAtual.year}',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ButtonCustom(
              onPressed: () => {Navigator.of(context).pushNamed('/baterponto')},
              text: 'Bater ponto',
            ),
          ),
        ],
      ),
    );
  }
}
