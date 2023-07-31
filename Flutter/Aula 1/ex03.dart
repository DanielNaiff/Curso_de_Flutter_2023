import 'package:flutter/material.dart';

void main() {
  final Map<String, List<String>> dados = {
    'Sobremesas': [
      'Torta de Maça',
      'Mousse de chocolate',
      'Pudim de leite condensado',
    ],
    'Pratos principais': [
      'Frango assado com batatas',
      'Espaguete à bolonhesa',
      'Risoto de cogumelos',
    ],
    'Aperitivos': [
      'Bolinhos de queijo',
      'Brucheta de tomate e manjericão',
      'Canapés de salmão com cream cheese',
    ],
  };

  runApp(MyApp(dados: dados));
}

class MyApp extends StatelessWidget {
  final Map<String, List<String>> dados;

  const MyApp({required this.dados});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu do Restaurante'),
        ),
        body: ListView.builder(
          itemCount: dados.length,
          itemBuilder: (context, index) {
            final categoria = dados.keys.elementAt(index);
            final items = dados[categoria]!;

            return ExpansionTile(
              title: Text(categoria),
              children: items.map((item) => ListTile(title: Text(item))).toList(),
            );
          },
        ),
      ),
    );
  }
}
