import 'dart:io';
void main() {
  List <double> listadeNotas = [];
  for(int i = 0; i < 4; i++ ){
    print('Digite a nota${i+1} do aluno:');
    double nota = double.parse(stdin.readLineSync()!);
    listadeNotas.add(nota);
  }
  print(listadeNotas);
}

void calculaMedia(List <double> lista){
  double soma = 0;
  double media = 0;
  for(int i = 0; i < lista.length; i++){
    soma += lista[i];
  }
  media = soma/lista.length;
  print(media);
}
