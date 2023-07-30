void main(){
//   Personagem personagem1  = Personagem(10,10,'Hero');
  Personagem jogador1  = Jogador(10,10,'Hero 2');
  Personagem inimigo1  = Inimigo (10,10,'Inimigo 1');
  jogador1.mostra();
  inimigo1.mostra();
  
  if(inimigo1.getposicaoX() == jogador1.getposicaoX()){
    print('Luta');
  }
}

abstract class Personagem{
  int posicaoX = 0;
  int posicaoY = 0;
  String nome;
  
  Personagem(this.posicaoX,this.posicaoY,this.nome);
  
  void mostra(){
    print('$nome esta na posicao $posicaoX e $posicaoY');
  }
  
  int getposicaoX() => posicaoX;
  int getposicaoY() => posicaoY;
}

class Jogador extends Personagem{
  Jogador(int posicaoX,int posicaoY,String nome): super(posicaoX,posicaoY,nome);
  
}

class Inimigo extends Personagem{
  Inimigo(int posicaoX,int posicaoY,String nome): super(posicaoX,posicaoY,nome);
  
}
