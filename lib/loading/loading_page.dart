import 'package:flutter/material.dart';
import 'package:ponto_open/library/adapters/storage_adapter.dart';
import 'package:ponto_open/library/configs/logos.dart';
import 'package:ponto_open/library/configs/storage_keys.dart';
import 'package:ponto_open/login/login_api.dart';
import 'package:ponto_open/login/login_storage.dart';
import 'package:ponto_open/widgets/loading_widget.dart';
import 'package:ponto_open/widgets/scafold_widget.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    _loading();
  }

  Future<void> _loading() async {
    Future.delayed(const Duration(seconds: 2));
    final empresaId =
        await StorageAdapter.getStringStorage(StorageKeys.empresaId);
    final usuarioId =
        await StorageAdapter.getStringStorage(StorageKeys.usuarioId);

    if (empresaId == null ||
        empresaId.isEmpty ||
        usuarioId == null ||
        usuarioId.isEmpty) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    } else {
      if (mounted) {
        final usuario = await LoginApi.login(
            usuarioId: usuarioId, empresaId: empresaId, context: context);
        if (usuario == null) {
          if (mounted) {
            Navigator.pushReplacementNamed(context, '/login');
          }
          return;
        }
        await LoginStorage.login(
            usuario: usuario, empresaId: empresaId, usuarioId: usuarioId);
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScafoldWidgetCustom(
      children: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              image: DecorationImage(
                image: Image.asset(Logos.logoGrande).image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const LoadingCustom(),
        ],
      ),
    );
  }
}
