import 'dart:async';

void main() {

    
  print(1);
  print(2);
  print(3);
//    Future<void> quatro = Future.delayed(
//   Duration(seconds: 3),
//   );
//   quatro.then((value) => print(4));
  quatro();
  print(5);
}
  Future<void> quatro() async{
    print(4);
    Future.delayed(Duration(seconds: 10), () => print(4));
  }
