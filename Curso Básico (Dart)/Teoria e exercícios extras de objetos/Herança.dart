void main() {
  Pessoa pessoa1 = Pessoa('João', 30);
  pessoa1.apresenta();

  Pai pai1 = Pai('Celio', 56,'Carpinteiro');
  pai1.apresenta();
  
  Filho filho1 = Filho('Daniel', 23, 'UFPA');
  filho1.apresenta();
}

class Pessoa{
  String nome;
  int idade;
  
  Pessoa(this.nome, this.idade);

  void apresenta(){
    print('Meu nome é $nome e minha idade é $idade');
  }
}

class Pai extends Pessoa{
  
  String profissao;
  
  Pai(nome,idade,this.profissao): super(nome, idade);
  
  
  @override
   void apresenta(){
    print('Meu nome é $nome e minha idade é $idade e trabalho é $profissao');
  }
}

class Filho extends Pessoa{
  
  String escola;
  
  Filho(nome,idade,this.escola): super(nome, idade);
  
  
  @override
   void apresenta(){
    print('Meu nome é $nome e minha idade é $idade e estudo na $escola');
  }
}
