import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ponto_open/configs/theme.dart';
import 'package:ponto_open/widgets/text_widget.dart';

class LoadingCustom extends StatelessWidget {
  const LoadingCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          LoadingAnimationWidget.threeRotatingDots(
            color: ThemeApp.primary,
            size: 30,
          ),
          const TextCustom(
            text: 'Carregando...',
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
