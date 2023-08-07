import 'package:flutter/material.dart';
//import 'package:calculadora_flutter/classes.dart';
import 'package:calculadora_flutter/screens.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Tela1(),
    ),
  );
}

String jjogador2 = '';

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  final _formKey = GlobalKey<FormState>();
  final _jogador1 = TextEditingController();
  final _jogador2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200.0,
                child: TextFormField(
                  controller: _jogador1,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text('Jogador 1'),
                      hintText: 'Fulano'),
                  validator: (_jogador1) {
                    if (_jogador1 == null || _jogador1.isEmpty) {
                      return 'Digite o nome do Primeiro jogador!';
                    }
                  },
                ),
              ),
              SizedBox(
                width: 200.0,
                child: TextFormField(
                  controller: _jogador2,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text('Jogador 2'),
                      hintText: 'Ciclano'),
                  validator: (_jogador2) {
                    if (_jogador2 == null || _jogador2.isEmpty) {
                      return 'Digite o nome do Segundo jogador!';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Tela2(
                              jogador1: _jogador1.text,
                              jogador2: _jogador2.text);
                        }));
                      }
                    },
                    child: const Text('Jogar')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
