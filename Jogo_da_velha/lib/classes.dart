import 'package:flutter/material.dart';
import 'package:calculadora_flutter/lógica.dart';
//import 'package:calculadora_flutter/screens.dart';
import 'package:calculadora_flutter/main.dart';

class Coluna extends StatefulWidget {
  final String jogador1;
  final String jogador2;

  const Coluna({
    super.key,
    required this.jogador1,
    required this.jogador2,
  });
  @override
  State<Coluna> createState() => _ColunaState();
}

class _ColunaState extends State<Coluna> {
  List matriz = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  @override
  void initState() {
    // TODO: implement initState
    jogadordaVez = widget.jogador1;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'JOGO DA VELHA',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child(alturaFixa: false, linha: 0, coluna: 0),
                child(alturaFixa: false, linha: 0, coluna: 1),
                child(alturaFixa: false, linha: 0, coluna: 2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child(alturaFixa: false, linha: 1, coluna: 0),
                child(alturaFixa: false, linha: 1, coluna: 1),
                child(alturaFixa: false, linha: 1, coluna: 2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child(alturaFixa: false, linha: 2, coluna: 0),
                child(alturaFixa: false, linha: 2, coluna: 1),
                child(alturaFixa: false, linha: 2, coluna: 2),
              ],
            ),
            Column(
              children: [
                if (ganhador == true)
                  Text('Vencedor: $vencedor',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                if (ganhador == true)
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          //style: style,
                          onPressed: () {
                            jogadorAtual = 'X';
                            ganhador = false;
                            jogadas = 0;
                            Navigator.pop(context,
                                MaterialPageRoute(builder: (context) {
                              return const Tela1();
                            }));
                          },
                          child: const Text('Voltar'))),
                if (ganhador == false)
                  Text('Jogador da vez: $jogadordaVez',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                if (jogadas == 9 && ganhador == false)
                  const Text('Empate!! Não houve vencedores!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                if (jogadas == 9 && ganhador == false)
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          //style: style,
                          onPressed: () {
                            jogadorAtual = 'X';
                            ganhador = false;
                            jogadas = 0;
                            Navigator.pop(context,
                                MaterialPageRoute(builder: (context) {
                              return const Tela1();
                            }));
                          },
                          child: const Text('Voltar'))),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget child(
      {required int linha, required int coluna, required bool alturaFixa}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: AbsorbPointer(
        absorbing: matriz[linha][coluna] == '' ? false : true,
        child: InkWell(
          onTap: () {
            setState(() {
              interacao(linha: linha, coluna: coluna, matriz: matriz);
            });
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 100,
            height: 100,
            child: Text(matriz[linha][coluna],
                style: const TextStyle(color: Colors.white, fontSize: 45)),
          ),
        ),
      ),
    );
  }
}
