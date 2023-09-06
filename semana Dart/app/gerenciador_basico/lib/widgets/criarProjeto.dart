import 'package:flutter/material.dart';

class criarProjeto extends StatelessWidget {
  const criarProjeto({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        child: const Icon(
          Icons.design_services,
        ),
      ),
      title: const Text('Criar projeto'),
      trailing: Container(
          height: 30, width: 30, child: const Icon(Icons.arrow_right_alt)),
    );
  }
}
