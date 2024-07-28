import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ponto_open/library/adapters/storage_adapter.dart';
import 'package:ponto_open/library/configs/logos.dart';
import 'package:ponto_open/library/configs/storage_keys.dart';
import 'package:ponto_open/library/configs/theme.dart';
import 'package:ponto_open/library/models/usuario.dart';
import 'package:ponto_open/library/utils/mascara.dart';
import 'package:ponto_open/widgets/text_widget.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  Usuario? usuario;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _inicializar();
    });
  }

  _inicializar() async {
    final usuarioStorage =
        await StorageAdapter.getStringStorage(StorageKeys.usuario);
    final newUsuario = Usuario.fromStorage(usuarioStorage);
    setState(() {
      usuario = newUsuario;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeApp.primary,
          borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(8), right: Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(
                      color: Colors.white,
                      text: '${usuario?.nome}',
                      fontSize: 16,
                    ),
                    TextCustom(
                      color: Colors.white,
                      text: '${Mascara.mascaraCpf(usuario?.cpf)}',
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: Image.asset(Logos.logoPequena).image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
