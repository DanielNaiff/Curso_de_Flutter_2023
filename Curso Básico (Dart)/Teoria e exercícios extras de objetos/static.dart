void main(){
//   Mundo meuMundo = Mundo();
//   meuMundo.gravidade = 10;
//   print(meuMundo.gravidade);
  
  Mundo.gravidade = 20;
  print(Mundo.gravidade);
  Mundo.duplicaGravidade();
}

class Mundo{
  static double gravidade = 9.81;
  
  Mundo();
  
  static void duplicaGravidade(){
    gravidade = gravidade * 2;
    print(gravidade);
  }
}
