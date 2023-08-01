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
  final String busca = 'queijo';
  int? categoria = 2;
  runApp(MyApp(dados: dados, categoria: categoria, busca: busca));
 
}

class MyApp extends StatelessWidget {
  final Map<String, List<String>> dados;
  final int? categoria;
  final String busca;

  const MyApp({required this.dados,required this.categoria, required this.busca});

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
            final category = dados.keys.elementAt(index);
            final items = dados[category]!;
            final filteredItems = items.where((item) => busca.isEmpty || item.toLowerCase().contains(busca.toLowerCase())).toList();
            if (categoria == index + 1 && filteredItems.isNotEmpty){
            return ExpansionTile(
              title: Text(category),
              children: items.map((item) => ListTile(title: Text(item))).toList(),
            );} else{
              return Container();
            }
          },
        ),
      ),
    );
  }
}
