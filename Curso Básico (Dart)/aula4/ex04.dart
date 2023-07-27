void main() {
  Carro camaro = Carro(
    kilometragem: 5000,
    qtdportas: 2,
    precoBase: 15000,
  );

  

  camaro.dados();
  camaro.estado();
  camaro.precoAdicional();

  print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');

  Moto suzuki = Moto(
    cilindradas: 160,
    precoBasem: 20000,
    partidaeletrica: 'Sim',
  );

  suzuki.dados();
  suzuki.estado();
  suzuki.precoAdicional();
  
}



class Carro{
  int kilometragem;
  int qtdportas;
  int precoBase;

  Carro({
    required this.kilometragem,
    required this.qtdportas,
    required this.precoBase,
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

  void precoAdicional(){
    print('Preço final (preço base + preço adicional):${(2*qtdportas) + (0.01*kilometragem) + precoBase} reais');
  }
}



class Moto{
  int cilindradas;
  String partidaeletrica;
  int precoBasem;

  Moto({
    required this.cilindradas,
    required this.partidaeletrica,
    required this.precoBasem,
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


  void precoAdicional(){
    int precodaPartida = 0;
      if (partidaeletrica == 'Sim'){
        precodaPartida = 500;
      }
    print('Preço final(preço adicional + preço base): ${(cilindradas*0.05) + precodaPartida + precoBasem}');
  }
}
