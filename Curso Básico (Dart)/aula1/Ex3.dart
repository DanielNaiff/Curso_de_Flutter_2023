void main(){
  String nome = 'João';
  print('Nome: $nome');
  
  int idade = 18;
  print('Idade: $idade');
  
  String ehNovato = 'Novato';
  print('Experiência: $ehNovato');
  
  String peso = '80 kg';
  print('Peso: $peso');
  
  var notas = [7,8,9,10];
  notas.add(10);//adicionando a nota bonûs
  notas.insert(2,0);//removendo a terceira nota
  final List <int> notas1Semestre = [7,8]; //criando uma nova lista
  notas.remove(11);//removendo a nota 11 caso tenha
  
  print('''Notas: 
  Nota 1: ${notas[0]}
  Nota 2: ${notas[1]}
  Nota 3: ${notas[2]}
  Nota 4: ${notas[3]}
  Nota Bonûs: ${notas[4]}
  ''');
  
  print('''Notas do 1 semestre:
  Nota 1: ${notas1Semestre[0]}
  Nota 2: ${notas1Semestre[1]}''');
  
  notas.sort();//colocando em ordem crescente
  
  print('Notas em ordem crescente: $notas');
  
  var disciplinas = ['Matemática', 'Biologia', 'História'];
  
  print('''Disciplinas:
  ${disciplinas[0]}
  ${disciplinas[1]}
  ${disciplinas[2]}''');
  
  String endereco = 'Trav. D. Romualdo de Seixas, 1.278 – Umarizal';
  print('Endereço: $endereco');
}
