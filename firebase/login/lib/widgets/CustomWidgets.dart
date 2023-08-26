// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  String? erroText;
  String labelText;
  TextEditingController controller;
  Formulario(
      {super.key,
      this.erroText,
      required this.labelText,
      required this.controller});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (value) => setState(() {
          widget.controller = value as TextEditingController;
        }),
        decoration: InputDecoration(
          labelText: widget.labelText,
          errorText: widget.erroText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final String text;
  Color? color;
  final void Function() onPressed;
  CustomButtom(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        padding: const EdgeInsets.all(10),
        color: color,
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
