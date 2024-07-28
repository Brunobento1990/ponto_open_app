import 'package:flutter/material.dart';
import 'package:ponto_open/home/home_page.dart';
import 'package:ponto_open/loading/loading_page.dart';
import 'package:ponto_open/login/login_page.dart';
import 'package:ponto_open/ponto/bater_ponto_page.dart';

class Routes {
  static String initialRoute = '/';
  static Map<String, Widget Function(BuildContext)> getRoutesApp() {
    return {
      '/': (context) => const LoadingPage(),
      '/login': (context) => const LoginPage(),
      '/home': (context) => const HomePage(),
      '/baterponto': (context) => const BaterPontoPage()
    };
  }
}
