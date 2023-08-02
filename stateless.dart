import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  int valor = 10;
  runApp(Myapp(title: 'Aplicativo olá mundo', valor: valor));
}
class Myapp extends StatelessWidget {
  final String title;
  final int valor;
  const Myapp({Key? key, this.title='', this.valor = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Center(
          child: Text(
            'Olá Mundo! O valor é '+ this.valor.toString(),
            style: TextStyle(
              fontSize: 50,
              color: Colors.black,
            ),
          ),
        ),
      ),);
  }
}
