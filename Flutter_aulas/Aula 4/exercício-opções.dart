import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Tela(),
  ));
}

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

List<String> opcoes = ['Opção 1', 'Opção 2', 'Opção 3'];

class _TelaState extends State<Tela> {
  String opcao = opcoes[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RadioListTile(
            title: const Text('Opção 1'),
            value: opcoes[0],
            groupValue: opcao,
            onChanged: (value) {
              setState(() {
                opcao = value.toString();
              });
            },
          ),
          RadioListTile(
            title: const Text('Opção 2'),
            value: opcoes[1],
            groupValue: opcao,
            onChanged: (value) {
              setState(() {
                opcao = value.toString();
              });
            },
          ),
          RadioListTile(
            title: const Text('Opção 3'),
            value: opcoes[2],
            groupValue: opcao,
            onChanged: (value) {
              setState(() {
                opcao = value.toString();
              });
            },
          ),
        ],
      ),
    );
  }
}
