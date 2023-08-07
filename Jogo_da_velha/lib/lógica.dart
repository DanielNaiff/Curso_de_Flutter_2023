import 'package:flutter/material.dart';
import 'package:calculadora_flutter/lógica.dart';
import 'package:calculadora_flutter/screens.dart';
import 'package:calculadora_flutter/main.dart';

String jogadorAtual = 'X';
String jogadordaVez = '';
String vencedor = '';
bool ganhador = false;
int jogadas = 0;
int placarjogador1 = 0;
int placarjogador2 = 0;

void interacao({required linha, required coluna, required matriz}) {
  matriz[linha][coluna] = jogadorAtual;

  if (jogadorAtual == 'X') {
    jogadordaVez = 'jogador2';
    jogadorAtual = 'O';
  } else {
    jogadordaVez = 'jogador1';
    jogadorAtual = 'X';
  }

  for (var l = 0; l < 3; l++) {
    if (matriz[l][0] == matriz[l][1] &&
        matriz[l][1] == matriz[l][2] &&
        matriz[l][0] != '') {
      vencedor = jogadordaVez;
      ganhador = true;
    }
  }

  for (var c = 0; c < 3; c++) {
    if (matriz[0][c] == matriz[1][c] &&
        matriz[1][c] == matriz[2][c] &&
        matriz[0][c] != '') {
      vencedor = jogadordaVez;
      ganhador = true;
    }
  }

  if (matriz[0][0] == matriz[1][1] &&
      matriz[1][1] == matriz[2][2] &&
      matriz[0][0] != '') {
    vencedor = jogadordaVez;
    ganhador = true;
  }

  if (matriz[2][0] == matriz[1][1] &&
      matriz[1][1] == matriz[0][2] &&
      matriz[2][0] != '') {
    vencedor = jogadordaVez;
    ganhador = true;
  }

  jogadas++;
}
