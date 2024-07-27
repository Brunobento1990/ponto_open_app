import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  const TextFieldCustom(
      {super.key,
      required this.controller,
      required this.label,
      this.validator,
      this.onChanged});

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: widget.label),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
