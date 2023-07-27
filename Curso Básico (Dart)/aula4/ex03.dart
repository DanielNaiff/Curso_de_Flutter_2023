void main() {
  Carro camaro = Carro(
    kilometragem: 5000,
    qtdportas: 2,
  );

  camaro.dados();
  camaro.estado();

  print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');

  Moto suzuki = Moto(
    cilindradas: 160,
    partidaeletrica: 'Sim',
  );

  suzuki.dados();
  suzuki.estado();
  
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
  void estado(){
    if(kilometragem < 15000 ){
      print('O carro é seminovo');
    }else if( kilometragem > 15000 && kilometragem < 20000){
      print('O carro é usado');
    }else{
      print('O carro é antigo');
    }
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
  void estado(){
     if(cilindradas < 125 ){
      print('A moto é leve');
    }else if( cilindradas > 125 && cilindradas < 500){
      print('A moto é normal');
    }else{
      print('A moto é esportiva');
    }
  }
}
