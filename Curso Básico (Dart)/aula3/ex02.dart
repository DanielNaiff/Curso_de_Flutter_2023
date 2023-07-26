import 'dart:math';
import 'dart:io';

void main() {
  
  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  int num = random(0, 10);
  print('Digite o número de chances:');
  int chances = int.parse(stdin.readLineSync()!);
  while (chances > 0){
    chances -= 1;
    print('Adivinhe o número:');
    int adivinhe = int.parse(stdin.readLineSync()!);
    if (adivinhe == num){
      print('Acertou!!');
      break;
    }else{
      if(adivinhe > num){
        print('''Errou! Seu número é maior
      ainda faltam ${chances}''');
      }else{
        print('''Errou! Seu número é menor
      ainda faltam ${chances}''');
      }
    }
  }
}
