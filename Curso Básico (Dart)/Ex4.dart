void main(){
  String nome = 'João';
  print('Nome: $nome');
  
  int idade = 18;
  print('Idade: $idade');
  
  String ehNovato = 'Novato';
  print('Experiência: $ehNovato');
  
  String peso = '70 kg';
  String pesoBalanca = '70';//Criando a variável
  int pesoAtual = int.parse(pesoBalanca.toString());
  print('Variável pesoAtual: $pesoAtual');
  print('Vaor absoluto: ${pesoAtual.abs()}');//valor absoluto
  print('Arredondando: ${pesoAtual+1}');//Arredondando
  print('Peso: $peso');
  
  var notas = [7,8,9,10];
  
  print('''Notas: 
  Nota 1: ${notas[0]}
  Nota 2: ${notas[1]}
  Nota 3: ${notas[2]}
  Nota 4: ${notas[3]}''');
  
  var disciplinas = ['Matemática', 'Biologia', 'História'];
  
  print('''Disciplinas:
  ${disciplinas[0]}
  ${disciplinas[1]}
  ${disciplinas[2]}''');
  
  String endereco = 'Trav. D. Romualdo de Seixas, 1.278 – Umarizal';
  print('Endereço: $endereco');
}
