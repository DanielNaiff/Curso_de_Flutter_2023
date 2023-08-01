import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplicativo exemplo scafold'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
              child: Text('Mesma linha 1', style: TextStyle(fontSize: 20)),
            ),
            const Center(
              child: Text('Mesma Linha 2', style: TextStyle(fontSize: 20)),
            ),
            const Center(
              child: Text('Mesma linha 3', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
