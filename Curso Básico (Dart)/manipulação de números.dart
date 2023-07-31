void main(){
  double pi = 3.1415;
  print(pi);
  print('Módulo: ${pi.abs()}');
  print('inteira: ${pi.toInt()}');
  print('Arredondar para baixo: ${pi.floor()}');
  print('Arredondar para cima: ${pi.ceil()}');
  print('String: ' + pi.toString());
  print('Limite: ${pi.clamp(1, 2)}');
  print('Arredonda para o inteiro mais próximo: ${pi.round()}');
  print('Escolho quantas casas quero mostrar: ${pi.toStringAsFixed(2)}');
  print('Tira as casas decimais:${pi.truncate()}');
  
  if (pi.isNegative){
    print('é negativo');
  }else{
    print('É positivo');
  }
}
