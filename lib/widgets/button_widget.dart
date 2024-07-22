import 'package:flutter/material.dart';
import 'package:ponto_open/configs/theme.dart';

class ButtonCustom extends StatefulWidget {
  final void Function()? onPressed;
  final String? text;
  final double? width;
  final double? heigth;
  const ButtonCustom(
      {super.key, required this.onPressed, this.text, this.width, this.heigth});

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeApp.primary,
        minimumSize:
            Size(widget.width ?? double.infinity, widget.heigth ?? 40.0),
      ),
      child: Text(
        widget.text ?? 'Continuar',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
