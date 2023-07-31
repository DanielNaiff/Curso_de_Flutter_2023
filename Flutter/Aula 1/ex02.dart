import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Minhas receitas'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => null,
            child: Text('OlÁ'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Sobremesas',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text('Torta de Maça'),

              Text('Mousse de chocolate'),

              Text('Pudim de leite condensado\n'),

              Center(
                child: Text(
                  'Pratos principais',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text('Frango assado com batatas'),
              Text('Espaguete á bolonhesa'),
              Text('Risoto de cogumelos\n'),
              
              Center(
                child: Text(
                  'Aperitivos',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text('Bolinhos de queijo'),
              Text('Brucheta de tomate e manjericão'),
              Text('Canapés de salmão com cream cheese\n'),
            ],
          )),
    );
  }
}
