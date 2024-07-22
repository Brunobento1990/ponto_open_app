import 'package:flutter/material.dart';

class ScafoldWidgetCustom extends StatelessWidget {
  final Widget children;

  const ScafoldWidgetCustom({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: children),
    );
  }
}
