import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ponto_open/library/configs/theme.dart';
import 'package:ponto_open/widgets/text_widget.dart';

class LoadingCustom extends StatelessWidget {
  final bool withMessage;
  const LoadingCustom({super.key, this.withMessage = true});

  @override
  Widget build(BuildContext context) {
    if (!withMessage) {
      return LoadingAnimationWidget.threeRotatingDots(
        color: ThemeApp.primary,
        size: 30,
      );
    }

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
