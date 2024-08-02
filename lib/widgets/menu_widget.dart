import 'package:flutter/material.dart';
import 'package:ponto_open/library/configs/theme.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
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
        height: 50,
        width: double.infinity,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.history,
              color: Colors.white,
            ),
            Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
