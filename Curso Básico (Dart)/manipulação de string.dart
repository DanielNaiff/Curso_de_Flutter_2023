void main(){
  String nome = '  Daniel Naiff  ';
  
  print(nome);
  print('1 Minúsculo: ' + nome.toLowerCase());
  print('2 Maiúculo: ' + nome.toUpperCase());
  print('3 Remove espaço:' + nome.trim());
  print('4 Remove o espaço a esquerda:' +nome.trimLeft());
  print('5 Remove o espaço a direita:' +nome.trimRight());
  print('6 Adiciona espaços: ' + nome.padLeft(30, ' '));
  print('7 Adiciona espaços: ' + nome.padLeft(30, '_'));
  print('8 Adiciona espaços: ' + nome.padRight(30, '_'));
  print('9 Tamanho: ${nome.length}');
  print('10 Pegar apenas um certo tamanho: ' + nome.substring(1,3));
  print('11 Me dá a posição do primeiro espaço: ${nome.indexOf(' ')}');
  print('12 Me dá a posição do primeiro caractere: ${nome.indexOf('a')}');
  print('13 Tranforma em lista: ${nome.split(' ')[0]}');
  print('14 Tranforma em lista: ${nome.split(' ')}');
 
}
