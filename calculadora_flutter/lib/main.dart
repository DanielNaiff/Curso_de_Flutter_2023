import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '0';

  void concatenacao(String tecla) {
    switch (tecla) {
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '0':
        setState(() {
          numero += tecla;
        });
        break;

      case 'AC':
        setState(() {
          numero = '0';
        });
        break;

      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Calculadora'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  numero,
                  style: TextStyle(fontSize: 72),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => concatenacao('AC'),
                  child: Text(
                    'AC',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                Text(' '),
                Text(' '),
                GestureDetector(
                  onTap: () => concatenacao('<x'),
                  child: Text(
                    '<X',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    concatenacao('7');
                  },
                  child: Text(
                    '7',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    concatenacao('8');
                  },
                  child: Text(
                    '8',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () => concatenacao('9'),
                  child: Text(
                    '9',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () => concatenacao('/'),
                  child: Text(
                    '/',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => concatenacao('4'),
                  child: Text(
                    '4',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () => concatenacao('5'),
                  child: Text(
                    '5',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () => concatenacao('6'),
                  child: Text(
                    '6',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () => concatenacao('x'),
                  child: Text(
                    'x',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => concatenacao('1'),
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () => concatenacao('2'),
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () => concatenacao('3'),
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () => concatenacao('-'),
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => concatenacao('0'),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () => concatenacao(','),
                  child: Text(
                    ',',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () => concatenacao('='),
                  child: Text(
                    '=',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                GestureDetector(
                  onTap: () => concatenacao('+'),
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ],
            ),
            Text('Coluna 6'),
          ],
        ),
      ),
    );
  }
}
