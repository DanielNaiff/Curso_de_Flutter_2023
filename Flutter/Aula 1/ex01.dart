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
          title: Text('Minhas receitas'),),
        floatingActionButton: FloatingActionButton(onPressed: () => null, child:Text('OlÁ'),),
        body: Center(
          child: Text('Sem receitas ainda'),
        ),
      ),
    );
  }
}
