import 'dart:io';
void main() {
  List <double> listadeNotas = [];
  double nota = 0;
  int i = 0;
  while(true){
    print('Digite a nota${i+1} do aluno(Digite -1 caso queira parar):');
    i += 1;
    double nota = double.parse(stdin.readLineSync()!);
    if (nota == -1){
      break;
    }
    listadeNotas.add(nota);
  }
  calculaMedia(listadeNotas);
}

void calculaMedia(List <double> lista){
  double soma = 0;
  double media = 0;
  for(int i = 0; i < lista.length; i++){
    soma += lista[i];
  }
  media = soma/lista.length;
  print('A média das notas é:${media}');
}
