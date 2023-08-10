import 'package:flutter/material.dart';
import 'package:sistema_de_registro/dashboard.dart';
import 'package:sistema_de_registro/screens.dart';

class Lista_Produtos extends StatefulWidget {
  const Lista_Produtos({super.key});

  @override
  State<Lista_Produtos> createState() => _Lista_ProdutosState();
}

// ignore: camel_case_types
class _Lista_ProdutosState extends State<Lista_Produtos> {
  String nome = '';
  String descricao = '';
  String preco = '';
  String quantidade = '';
  List dados = [
    ['Produto 1', 'Descrição', 3.00, 3],
    ['Produto 2', 'Descrição', 5.00, 15],
    ['Produto 3', 'Descrição', 7.00, 10],
    ['Produto 4', 'Descrição', 11.00, 12],
    ['Produto 5', 'Descrição', 13.00, 20],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
    ['', '', 0.0, 0],
  ];

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nome = TextEditingController();
    int i = 0;
    int c = 0;

    while (true) {
      c += 1;
      if (dados[c][0] == '') {
        i = c;
        break;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus produtos'),
        actions: [
          Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return estatisticas(dados);
                    }));
                  },
                  icon: Icon(Icons.dashboard)))
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: _formKey,
        child: ListView.builder(
            itemCount: dados.length,
            itemBuilder: (context, index) {
              i = index;

              if (dados[index][0] != '') {
                return ListTile(
                  leading:
                      const Icon(Icons.shopping_bag, color: Colors.deepOrange),
                  title: Text(dados[index][0]),
                  subtitle: Text(dados[index][1]),
                  trailing: SizedBox(
                    width: 200,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                dados[index][3] -= 1;
                              });
                            },
                            icon: const Icon(Icons.remove,
                                color: Colors.blueAccent)),
                        SizedBox(
                            width: 30,
                            child: Center(
                                child: Text('X${dados[index][3]}',
                                    style: const TextStyle(fontSize: 15)))),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                dados[index][3] += 1;
                              });
                            },
                            icon: const Icon(Icons.add,
                                color: Colors.blueAccent)),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => SimpleDialog(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: TextFormField(
                                              controller: _nome,
                                              decoration: const InputDecoration(
                                                icon: Icon(Icons.inventory_2),
                                                hintText: 'Nome do produto',
                                                labelText: 'Nome *',
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  nome = value;
                                                });
                                              },
                                              validator: (_nome) {
                                                if (_nome == null ||
                                                    _nome.isEmpty) {
                                                  return 'Digite o nome do produto';
                                                }
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                icon: Icon(Icons.description),
                                                hintText: 'Descrição',
                                                labelText: 'Descrição',
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  descricao = value;
                                                });
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Digite a descrição';
                                                }
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                icon: Icon(Icons.inventory_2),
                                                hintText: 'Quantidade',
                                                labelText: 'Quantidade',
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  quantidade = value;
                                                });
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Digite o nome do produto';
                                                }
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 100,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                icon: Icon(Icons.attach_money),
                                                hintText: 'Digite o preço',
                                                labelText: 'Preço *',
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  preco = value;
                                                });
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Digite algum preco';
                                                }
                                              },
                                            ),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  dados[index][0] = nome;
                                                  dados[index][1] = descricao;
                                                  dados[index][2] =
                                                      int.parse(preco);
                                                });
                                                dados[index][3] =
                                                    (int.parse(quantidade));
                                              },
                                              child: const Text('Atualizar'))
                                        ],
                                      ));
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                dados.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete,
                                color: Color.fromARGB(255, 255, 0, 0))),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return edicao(dados, i);
              },
            ),
          );
        },
      ),
    );
  }
}
