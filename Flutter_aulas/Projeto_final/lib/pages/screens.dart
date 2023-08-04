import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Column,
        EdgeInsets,
        ElevatedButton,
        Navigator,
        Padding,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;
import 'package:programabase/classes.dart';

class TelaDescricao extends StatelessWidget {
  final Prato prato;

  const TelaDescricao({super.key, required this.prato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(prato.nome)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${prato.preco}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('fazer pedido'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('cancelar pedido'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
