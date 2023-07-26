import 'dart:io';

void main() {
  final calcularDesconto = (double valorOriginal, double desconto) => valorOriginal - (valorOriginal * (desconto / 100));

  print("Digite o valor original do produto:");
  double valorOriginal = double.parse(stdin.readLineSync()!);

  print("Digite a porcentagem de desconto:");
  double desconto = double.parse(stdin.readLineSync()!);

  double valorComDesconto = calcularDesconto(valorOriginal, desconto);

  print("O valor com desconto é: \$${valorComDesconto}");
}
