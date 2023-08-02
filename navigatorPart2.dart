import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tela1(),
      routes: {
        '/': (context) => Tela1(),
        '/tela2': (context) => Tela2(),
      },
    );
  }
}

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Tela1'),
          ),
          body: Center(
            child: ElevatedButton(
              child: Text('Ir para a tela 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/tela2');
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tela2'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) {
                return Tela1();
              }));
            },
            child: Text('Ir para tela 1'),
          ),
        ),
      ),
    );
  }
}
