import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  const TextCustom(
      {super.key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
