import 'dart:io';

void main() {
  print("Digite um número");
  double num1 = double.parse(stdin.readLineSync()!);
  print("Digite outro número");
  double num2 = double.parse(stdin.readLineSync()!);

  print('A soma entre $num1 e $num2 é ${num1 + num2}');
  print("A subtração entre $num1 e $num2 é ${num1 - num2}");
  print("A multiplicação entre $num1 e $num2 é ${num1 * num2}");
  print("A Divisão entre $num1 e $num2 é ${num1 / num2}");
  print("O resto da divisão entre $num1 e $num2 é ${num1 % num2}");
}
