import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ponto_open/library/configs/theme.dart';
import 'package:ponto_open/library/notifier/loading_notifier.dart';
import 'package:provider/provider.dart';

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
    return Consumer<LoadingNotifier>(builder: (context, provider, child) {
      return ElevatedButton(
        onPressed: provider.loading ? null : widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeApp.primary,
          minimumSize:
              Size(widget.width ?? double.infinity, widget.heigth ?? 40.0),
        ),
        child: provider.loading
            ? LoadingAnimationWidget.threeRotatingDots(
                color: Colors.white,
                size: 30,
              )
            : Text(
                widget.text ?? 'Continuar',
                style: const TextStyle(color: Colors.white),
              ),
      );
    });
  }
}
