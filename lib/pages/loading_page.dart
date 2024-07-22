import 'package:flutter/material.dart';
import 'package:ponto_open/configs/logos.dart';
import 'package:ponto_open/configs/storage_keys.dart';
import 'package:ponto_open/storage/acess_storage.dart';
import 'package:ponto_open/widgets/loading_custom.dart';
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
    await Future.delayed(const Duration(seconds: 2));
    final empresaId =
        await AcessStorage.getStringStorage(StorageKeys.empresaId);
    final usuarioId =
        await AcessStorage.getStringStorage(StorageKeys.usuarioId);

    if (empresaId == null ||
        empresaId.isEmpty ||
        usuarioId == null ||
        usuarioId.isEmpty) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    } else {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
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
