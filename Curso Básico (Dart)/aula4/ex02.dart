void main() {
  Carro camaro = Carro(
    kilometragem: 5000,
    qtdportas: 2,
  );

  camaro.dados();

  print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');

  Moto suzuki = Moto(
    cilindradas: 160,
    partidaeletrica: 'Sim',
  );

  suzuki.dados();
  
}
class Carro{
  int kilometragem;
  int qtdportas;

  Carro({
    required this.kilometragem,
    required this.qtdportas,
  });

  void dados(){
  print('''Kilometragem: ${kilometragem} km
Quantidade de portas: ${qtdportas}''');
}
}

class Moto{
  int cilindradas;
  String partidaeletrica;

  Moto({
    required this.cilindradas,
    required this.partidaeletrica,
  });
  void dados(){
  print('''Cilindradas: ${cilindradas} 
Possui partida elétrica? ${partidaeletrica}''');
}
}
