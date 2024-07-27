import 'package:flutter/material.dart';
import 'package:ponto_open/library/configs/theme.dart';
import 'package:ponto_open/routes.dart';

void main() {
  runApp(const InitialApp());
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ThemeApp.primary),
        useMaterial3: true,
      ),
      initialRoute: Routes.initialRoute,
      routes: Routes.getRoutesApp(),
    );
  }
}
