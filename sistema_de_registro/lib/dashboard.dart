import 'package:flutter/material.dart';

class estatisticas extends StatefulWidget {
  final List dados;
  //final int soma;
  const estatisticas(this.dados, {super.key});

  @override
  State<estatisticas> createState() => _estatisticasState();
}

class _estatisticasState extends State<estatisticas> {
  @override
  Widget build(BuildContext context) {
    int soma = 0;
    int count = 0;
    double somaPreco = 0;
    double e = 0;
    int t = 0;
    for (int d = 0; d < 18; ++d) {
      t = widget.dados[d][3];
      soma = soma + t;
    }
    for (var e = 0; e < 18; ++e) {
      t = widget.dados[e][2];
      somaPreco = somaPreco + t;
    }

    for (int i = 0; i < 18; ++i) {
      if (widget.dados[i][3] < 5 && widget.dados[i][0] != '') {
        count = i;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estatística'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.info, color: Colors.deepOrange),
            title: const Text('Quantidade total: '),
            trailing: (Text('${soma}')),
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.deepOrange),
            title: const Text('Preço total: '),
            trailing: (Text('${somaPreco}')),
          ),
          const ListTile(
            leading: Icon(Icons.info, color: Colors.deepOrange),
            title: Text('Itens com estoque baixo: '),
          ),
          ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.deepOrange),
              title: Text(widget.dados[count][0]),
              subtitle: Text(widget.dados[count][1]),
              trailing: Text('${widget.dados[count][3]}'))
        ],
      ),
    );
  }
}
