import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Pedido {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Pedido({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
}

Future<List<Pedido>> buscarPedidos() async {
  String link = 'https://jsonplaceholder.typicode.com/posts/1/comments';
  Uri url = Uri.parse(link);
  http.Response resposta = await http.get(url);
  String conteudo = resposta.body;

  List<Map<String, dynamic>> dados =
      List<Map<String, dynamic>>.from(jsonDecode(conteudo));

  List<Pedido> pedidos = dados.map((map) {
    return Pedido(
      postId: map['postId'],
      id: map['id'],
      name: map['name'],
      email: map['email'],
      body: map['body'],
    );
  }).toList();

  return pedidos;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PedidoListView(),
    );
  }
}

class PedidoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Pedido>>(
        future: buscarPedidos(),
        builder: (context, snapshot) {
          List<Pedido>? pedidos = snapshot.data;
          return ListView.builder(
            itemCount: pedidos?.length ?? 0,
            itemBuilder: (context, index) {
              Pedido pedido = pedidos![index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: ListTile(
                    title: Text(pedido.name),
                    subtitle: Text(pedido.email),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
