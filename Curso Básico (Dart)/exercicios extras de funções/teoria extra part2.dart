void main() {
  nomesEidades('Daniel', 23);
  print('-=-=-=-=-=-=-=-=-=-=-');
  print(ePar(4));
  print('-=-=-=-=-=-=-=-=-=-=-');
  nomeTelefone('Daniel',telefone: '891371203');
  print('-=-=-=-=-=-=-=-=-=-=-');
  nomeTelefone('Djose');
}

void nomeTelefone(String nome, {String? telefone}){
  print('Nome $nome Telefone: $telefone');
}

bool ePar(int num){
  if(num % 2 == 0){
    return true;
  }else{
    return false;
  }
}

void nomesEidades(String nome, int idade) {
  print('Nome........:' + nome);
  print('Idade.......:' + idade.toString());
}
