import 'package:flutter/material.dart';
import 'package:sistema_de_registro/lista.dart';

// ignore: camel_case_types
class edicao extends StatefulWidget {
  final int i;
  final List dados;

  const edicao(this.dados, this.i, {super.key});

  @override
  State<edicao> createState() => _edicaoState();
}

class _edicaoState extends State<edicao> {
  String nome2 = '';
  String descricao2 = '';
  String preco2 = '';
  String quantidade2 = '';
  List dados = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.inventory_2),
              hintText: 'Nome do produto',
              labelText: 'Nome *',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Digite o nome do produto';
              }
            },
            onChanged: (value) {
              setState(
                () {
                  nome2 = value;
                },
              );
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.description),
              hintText: 'Descrição ',
              labelText: 'Descrição',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Digite a descrição';
              }
            },
            onChanged: (value) {
              setState(() {
                descricao2 = value;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.production_quantity_limits),
              hintText: 'Quantidade',
              labelText: 'Quantidade',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Digite a quantidade certa';
              }
            },
            onChanged: (value) {
              setState(() {
                quantidade2 = value;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.attach_money),
              hintText: 'Digite o preço',
              labelText: 'Preço *',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Digite algum preco ';
              }
            },
            onChanged: (value) {
              setState(() {
                preco2 = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    // int i = 0;
                    // int c = 0;
                    // while (true) {
                    //   c += 1;
                    //   if (dados[c][0] == '') {
                    //     i = c;
                    //     break;
                    //   }
                    // }
                    widget.dados[widget.i][0] = (nome2);
                    widget.dados[widget.i][1] = (descricao2);
                    widget.dados[widget.i][2] = (double.parse(preco2));
                    widget.dados[widget.i][3] = (int.parse(quantidade2));

                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) {
                      return const Lista_Produtos();
                    }));
                  },
                );
              },
              child: const Text('Atualizar'),
            ),
          ),
        ],
      ),
    );
  }
}
