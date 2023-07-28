import 'dart:async';

Future <String> fetchData() async {
    // await Future.delayed(Duration(seconds: 3)).then((_){
    //   print('Passaram-se 3 segundos');
    // });
    // return 'Dados obtidos';

    await Future.delayed(Duration(seconds: 3));
  return "Dados obtidos";
}
Future<void> main() async {

   fetchData().then((fetchData){
    print(fetchData);
  });
  // print(result);
  
}
