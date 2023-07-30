void main(){
  
  List <Pessoa> pessoas = [Pessoa('joao',20),Pessoa('Pedro',25)];
  print(pessoas[1].nome);
  pessoas.add(Pessoa('maria',27));
  
  pessoas.forEach((Pessoa pessoa) => print(pessoa.nome));
  
  Pessoa pessoa1 = Pessoa('Joao',20);
  pessoa1.apresenta();
  
}

class Pessoa{
  
  String nome;
  int idade;
  
  Pessoa(this.nome, this.idade);
  
  void apresenta(){
    print('Meu nome é $nome e tenho $idade anos');
  }
}
