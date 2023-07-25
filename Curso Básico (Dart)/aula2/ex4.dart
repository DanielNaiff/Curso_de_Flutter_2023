import 'dart:io';

void main() {
  print('Digite a idade');
  int idade = int.parse(stdin.readLineSync()!);
  if (idade >= 18) {
    print('usuário é maior de idade');
  } else {
    print('Usuário é menor de idade');
  }
}
