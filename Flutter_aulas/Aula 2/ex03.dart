import 'package:flutter/material.dart';

void main() {
  final Map<String, List<String>> dados = {
    'Sobremesas': [
      'Torta de Maçã',
      'Mousse de Chocolate',
      'Pudim de Leite Condensado',
    ],
    'Pratos principais': [
      'Frango Assado com Batatas',
      'Espaguete à Bolonhesa',
      'Risoto de Cogumelos',
    ],
    'Aperitivos': [
      'Bolinhos de Queijo',
      'Bruschetta de Tomate e Manjericão',
      'Canapés de Salmão com Cream Cheese',
    ],
    'Comidas Italianas': [
      'Pizza',
      'Raviolli',
      'Lasagna',
    ],
    'Comidas Russas': [
      'Smetana',
      'Frango à Kiev',
      'Arenque sob casaco de pele',
    ]
  };

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Minhas receitas')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (MapEntry<String, List<String>> entry in dados.entries)
            CustomRecipeContainer(
              categoria: entry.key,
              pratos: entry.value,
            ),
        ],
      ),
    ),
  ));
}

class CustomRecipeContainer extends StatelessWidget {
  final String categoria;
  final List<String> pratos;

  CustomRecipeContainer({
    required this.categoria,
    required this.pratos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              categoria,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (String dish in pratos)
                Text(
                  dish,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
