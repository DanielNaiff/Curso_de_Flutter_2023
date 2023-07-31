import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplicativo Olá mundo!'),
        ),
        body: Center(
          child: Text(
            'Olá Mundo!',
            style: TextStyle(
              fontSize: 50,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}
