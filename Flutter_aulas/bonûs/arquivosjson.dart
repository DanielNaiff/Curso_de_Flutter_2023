import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class Pedido {
  final int id;
  final int idUsuario;
  final String titulo;
  final bool finalizado;

  const Pedido({
    required this.id,
    required this.idUsuario,
    required this.titulo,
    required this.finalizado,
  });
}

Future<Pedido> criarPedido() async {
  String link = 'https://jsonplaceholder.typicode.com/todos/1';
  Uri url = Uri.parse(link);
  Response resposta = await get(url);
  String conteudo = resposta.body;
  print(conteudo);

  Map dados = jsonDecode(conteudo);
  return Pedido(
    id: dados['id'],
    idUsuario: dados['userId'],
    titulo: dados['title'],
    finalizado: dados['completed'],
  );
}

void main() {
  runApp(const MaterialApp(
    home: Tela(),
  ));
}

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<Pedido>(
        future: criarPedido(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Carregando...');
          }
          Pedido? pedido = snapshot.data;
          if (pedido == null) {
            return const Text('ocorreu um erro');
          }
          return Text(pedido.titulo);
        },
      )),
    );
  }
}
