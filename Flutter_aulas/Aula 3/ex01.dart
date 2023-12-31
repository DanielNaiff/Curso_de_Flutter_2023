import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final Map<String, List<String>> dados = {
    'Sobremesas': [
      'Torta de maçã',
      'Mousse de chocolate',
      'Pudim de leite condesado'
    ],
    'Pratos principais': [
      'Frango assado com batatas',
      'Espagueti á bolonhesa',
      'Risoto de cogumelo'
    ],
    'Aperitivos': [
      'Bruscheta de tomate com manjericão',
      'Bolinhos de queijo',
      'Canapés de salmão com cream cheese'
    ],
  };

  String searchText = '';
  List<String> searchResults = [];

  void searchInMap(String query) {
    setState(() {
      searchResults = dados.entries
          .where(
              (entry) => entry.key.toLowerCase().contains(query.toLowerCase()))
          .expand((entry) => entry.value.where(
              (dish) => dish.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  final int? categoriausuario = null;
  final String busca = '';

  @override
  Widget build(BuildContext context) {
    final entries = dados.entries.toList();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Minhas receitas')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  searchText = value.toLowerCase();
                  searchInMap(searchText);
                },
                decoration: InputDecoration(
                  labelText: 'Search for a food dish',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final dish = searchResults[index];
                  return ListTile(
                    title: Text(dish),
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < entries.length; i++)
                  if (categoriausuario == null || categoriausuario == i + 1)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (busca.isEmpty)
                          Center(
                            child: Text(
                              entries[i].key,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (String valor in entries[i].value)
                              if (busca.isEmpty || valor.contains(busca))
                                Text(
                                  valor,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                          ],
                        ),
                      ],
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
