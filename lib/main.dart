import 'package:flutter/material.dart';
import 'package:ponto_open/library/configs/theme.dart';
import 'package:ponto_open/library/notifier/loading_notifier.dart';
import 'package:ponto_open/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingNotifier()),
      ],
      child: const InitialApp(),
    ),
  );
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
