void main(){
  Map <int, String> numeros = Map();
  numeros[1] = 'um';
  numeros[2] = 'dois';
  numeros[3] = 'três';
  numeros[100] = 'cem';
  
  print(numeros);
  
  Map <String,String> estados = Map();
  estados['Sp'] = 'São Paulo';
  estados['Rj'] = 'Rio de Janeiro';
  
  print(estados);
  print('Keys ${estados.keys}');
  print('Valores ${estados.values}');
}
