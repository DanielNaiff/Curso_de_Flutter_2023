import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Stack App'),
          ),
          body: Stack(alignment: AlignmentDirectional.center, children: [
            Container(width: 200, height: 200, color: Colors.black),
            Container(
                width: 100,
                height: 100,
                color: const Color.fromARGB(255, 235, 4, 4))
          ])),
    );
  }
}
