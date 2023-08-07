//import 'dart:async';
import 'package:http/http.dart' as http;

void main() async {
  final uri = Uri.https('www.example.com', '/');
  final future = http.get(uri);
  future.then((response) {
    if (response.statusCode == 200) {
      print('Página carregada com sucesso.');
    }

    if (response.statusCode == 301) {
      print('Página movida permanentemente.');
    }

    if (response.statusCode == 404) {
      print('Página não encontrada.');
    }

    if (response.statusCode == 500) {
      print('Erro interno no servidor.');
    }

    print(response.body);
  });
  future.catchError((onError) => print('Erro'));
  future.whenComplete(() => print('Future completo!'));
}
