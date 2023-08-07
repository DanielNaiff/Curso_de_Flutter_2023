import 'package:calculadora_flutter/l%C3%B3gica.dart';
import 'package:flutter/material.dart';
//import 'package:calculadora_flutter/main.dart';
import 'package:calculadora_flutter/classes.dart';

class Tela2 extends StatelessWidget {
  final String jogador1;
  final String jogador2;
  const Tela2({
    super.key,
    required this.jogador1,
    required this.jogador2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Coluna(
        jogador1: jogador1,
        jogador2: jogador2,
      ),
    ));
  }
}
