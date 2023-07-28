import 'dart:async';
import 'dart:io';

void main() {
  var controller = StreamController<List<String>>();

  while(true){
  print("Digite uma lista de nomes separados por vírgula(Digite y para parar):");
  var input = stdin.readLineSync();
  var names = input?.split(',') ?? [];
  if(input == 'y' || input == 'Y'){
    break;
  }else{
    controller.add(names);
   }
  }
  getLengths(controller.stream).then((lengths) {
    print("Comprimentos dos nomes: $lengths");
    controller.close();
  });
}

Future<List<int>> getLengths(Stream<List<String>> stream) async {
  var lengths = await stream
      .asyncExpand((nameList) => Stream.fromIterable(nameList))
      .map((name) => name.length)
      .toList();
  return lengths;
}
