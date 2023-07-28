import 'dart:async';

Stream<int> contdownnumber(int max) async*{
  for (int i = max; i == 1 ; i--){
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
Future <void> main() async {

   final stream<int> numberStream = contdownnumber(5);

  numberStream.listen((number){
    print(number);
  });

  print('Aguarde 1 segundos');
}
