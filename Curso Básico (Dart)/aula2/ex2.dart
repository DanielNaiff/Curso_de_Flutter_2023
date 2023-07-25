import 'dart:io';

void main() {
  print('Digite um número');
  int num = int.parse(stdin.readLineSync()!);

  if (num % 2 == 0) {
    print('Seu número é par');
  } else {
    print('Seu número é impar');
  }
}
