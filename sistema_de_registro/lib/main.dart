import 'package:flutter/material.dart';
import 'package:sistema_de_registro/lista.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de estoque',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        splashColor: Colors.deepOrange,
        brightness: Brightness.dark,
        //useMaterial3: true,
      ),
      home: Lista_Produtos(),
    );
  }
}
