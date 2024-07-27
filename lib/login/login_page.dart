import 'package:flutter/material.dart';
import 'package:ponto_open/library/configs/logos.dart';
import 'package:ponto_open/library/configs/theme.dart';
import 'package:ponto_open/login/login_api.dart';
import 'package:ponto_open/login/login_storage.dart';
import 'package:ponto_open/widgets/button_widget.dart';
import 'package:ponto_open/widgets/scafold_widget.dart';
import 'package:ponto_open/widgets/text_field_widget.dart';
import 'package:ponto_open/widgets/text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController chaveDeAcessoController = TextEditingController();
  TextEditingController usuarioChaveController = TextEditingController();
  String _usuarioId = '';
  String _empresaId = '';

  Future<void> _login() async {
    if (_usuarioId.isEmpty || _empresaId.isEmpty) {
      return;
    }
    final usuario = await LoginApi.login(
        usuarioId: _usuarioId, empresaId: _empresaId, context: context);
    if (usuario == null) {
      return;
    }
    await LoginStorage.login(
        usuario: usuario, empresaId: _empresaId, usuarioId: _usuarioId);
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScafoldWidgetCustom(
      children: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                    TextCustom(
                      text: 'Login',
                      fontSize: 40.0,
                      color: ThemeApp.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const TextCustom(
                  text: 'Adicione a chave da sua empresa',
                ),
                const TextCustom(
                  text: 'e sua chave que você recebeu em seu e-mail',
                ),
                const SizedBox(height: 20.0),
                TextFieldCustom(
                  controller: chaveDeAcessoController,
                  label: 'Chave da empresa',
                  onChanged: (value) => _empresaId = value,
                ),
                const SizedBox(height: 16.0),
                TextFieldCustom(
                  controller: usuarioChaveController,
                  label: 'Sua chave',
                  onChanged: (value) => _usuarioId = value,
                ),
                const SizedBox(height: 16.0),
                ButtonCustom(onPressed: _login),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
