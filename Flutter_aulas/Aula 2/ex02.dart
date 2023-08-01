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
              Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    'Sobremesas',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text('Torta de Maça'),
              ),
              Flexible(
                flex: 1,
                child: Text('Mousse de chocolate'),
              ),
              Flexible(
                flex: 1,
                child: Text('Pudim de leite condensado\n'),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    'Pratos principais',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text('Frango assado com batatas'),
              ),
              Flexible(
                flex: 1,
                child: Text('Espaguete á bolonhesa'),
              ),
              Flexible(
                flex: 1,
                child: Text('Risoto de cogumelos\n'),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    'Aperitivos',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text('Bolinhos de queijo'),
              ),
              Flexible(
                flex: 1,
                child: Text('Brucheta de tomate e manjericão'),
              ),
              Flexible(
                flex: 1,
                child: Text('Canapés de salmão com cream cheese\n'),
              ),
            ],
          )),
    );
  }
}
