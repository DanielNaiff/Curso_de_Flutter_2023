import 'dart:io';

void main(){
  List lista = [0,1,2,3,4,5,6,67,7,8,9,34,3,432,23,42,1,4,454,5];
  List listapar = [];
  print('Digite o preço máximo:');
  int max = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < lista.length; i++){
    if (lista[i] <= max && lista[i]%2==0){
      listapar.add(lista[i]);
    }
  }
  print(listapar);
}
