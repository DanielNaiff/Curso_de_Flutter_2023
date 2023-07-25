import 'dart:io';

void main() {
  print('Digite um número');
  int opcao = int.parse(stdin.readLineSync()!);
  switch (opcao) {
    case 1:
      print('Hoje é segunda feira');
      break;
    case 2:
      print('Hoje é terça feira');
      break;
    case 3:
      print('Hoje é quarta feira');
      break;
    case 4:
      print('Hoje é quinta feira');
      break;
    case 5:
      print('Hoje é sexta feira');
      break;
    case 6:
      print('Hoje é sábado feira');
      break;
    case 7:
      print('Hoje é domingo feira');
      break;
  }
}
