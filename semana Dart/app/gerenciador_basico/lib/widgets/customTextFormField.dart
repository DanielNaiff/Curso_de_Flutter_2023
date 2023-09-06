import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  String? erroText;
  String labelText;
  TextEditingController controller;
  Formulario({
    super.key,
    this.erroText,
    required this.labelText,
    required this.controller,
  });

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
