void main() {
  Carro camaro = Carro(
    modelo: 'Camaro',
    marca: 'Chevrolet',
    anodeFabricao: '2012',
  );
  camaro.ligar();
  camaro.desligar();
  camaro.acelerar();
  camaro.frear();
  camaro.fecharPorta();
}
class Carro {
  String modelo;
  String marca;
  String anodeFabricao;

  Carro({
    required this.modelo,
    required this.marca,
    required this.anodeFabricao,
  });

  void ligar() {
    print("Carro ligado!");
  }

  void desligar() {
    print("Carro desligado!");
  }

  void acelerar() {
    print("Carro acelerando");
  }

  void frear() {
    print("Carro freando");
  }

  void abrirPorta(){
    print('Porta aberta');
  }

  void fecharPorta(){
    print('Fechando porta');
  }
}
