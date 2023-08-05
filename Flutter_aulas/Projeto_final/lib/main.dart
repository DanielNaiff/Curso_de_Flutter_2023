import 'package:flutter/material.dart';
import 'package:programabase/classes.dart';
// ignore: unused_import
import 'package:programabase/pages/screens.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Tela(),
    ),
  );
}

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  String busca = '';
  @override
  Widget build(BuildContext context) {
    List<Categoria> categorias = const [
      Categoria(
        nome: 'Sobremesa',
        pratos: [
          Prato(nome: 'Torta de Maçã', preco: 50),
          Prato(nome: 'Mousse de Chocolate', preco: 30),
          Prato(nome: 'Pudim de Leite Condensado', preco: 20)
        ],
      ),
      Categoria(
        nome: 'Pratos principais',
        pratos: [
          Prato(nome: 'Frango Assado com Batatas', preco: 70),
          Prato(nome: 'Espaguete à Bolonhesa', preco: 80),
          Prato(nome: 'Risoto de Cogumelos', preco: 90)
        ],
      ),
      Categoria(
        nome: 'Aperitivos',
        pratos: [
          Prato(nome: 'Bolinhos de Queijo', preco: 40),
          Prato(nome: 'Bruschetta de Tomate ', preco: 80),
          Prato(nome: 'Canapés de Salmão ', preco: 90)
        ],
      ),
      Categoria(
        nome: 'Comidas Italianas',
        pratos: [
          Prato(nome: 'Pizza', preco: 70),
          Prato(nome: 'Raviolli', preco: 80),
          Prato(nome: 'Lasagna', preco: 60)
        ],
      ),
      Categoria(
        nome: 'Comidas Russas',
        pratos: [
          Prato(nome: 'Smetana', preco: 70),
          Prato(nome: 'Frango à Kiev', preco: 80),
          Prato(nome: 'Arenque', preco: 60)
        ],
      ),
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: busca,
              onChanged: (valor) {
                setState(
                  () {
                    busca = valor;
                  },
                );
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'Digite o prato de comida',
                labelText: 'Bucar',
              ),
            ),
          ),
          for (Categoria categoria in categorias)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Secao(
                titulo: categoria.nome,
                pratos: categoria.pratos
                    .where((prato) => prato.nome.contains(busca))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
