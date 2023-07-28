import 'dart:async';

Stream<int> contdownnumber(int max) async*{
  for (int i = max; i >= 1 ; i--){
    print('Aguarde 1 segundo');
    yield i;
    await Future.delayed(const Duration(seconds: 1));
  }
}
Future <void> main() async {

   final Stream<int> numberStream = contdownnumber(5);

  numberStream.listen((number){
    print(number);
  });
}
