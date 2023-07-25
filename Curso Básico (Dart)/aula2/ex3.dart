import 'dart:io';

void main() {
  print('Digite um número');
  double num = double.parse(stdin.readLineSync()!);
  print('O número é maior que 10 e menor que 20?${num > 10 && num < 20}');
  print('O número é igual a 0 ou igual a 50? ${num == 0 || num == 50}');
  print(
      'O número é diferente de 100 ou igual a 200? ${num != 100 || num == 200}');
}
