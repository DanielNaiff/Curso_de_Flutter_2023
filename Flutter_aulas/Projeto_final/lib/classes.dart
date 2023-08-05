import 'package:flutter/material.dart';
import 'package:programabase/pages/screens.dart';

class Categoria {
  final String nome;
  final List<Prato> pratos;

  const Categoria({required this.nome, required this.pratos});
}

class Prato {
  final String nome;
  final double preco;

  const Prato({required this.nome, required this.preco});
}

class Secao extends StatelessWidget {
  final String titulo;
  final List<Prato> pratos;

  const Secao({
    super.key,
    required this.titulo,
    required this.pratos,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Center(
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            for (Prato prato in pratos)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  width: screenWidth / 5,
                  height: screenHeigth / 15,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Expanded(
                    flex: 2,
                    child: CardPrato(
                      prato: prato,
                      icone: const Icon(Icons.restaurant),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class CardPrato extends StatelessWidget {
  final Prato prato;
  final Icon icone;

  const CardPrato({
    super.key,
    required this.prato,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        bool? resultado = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => TelaDescricao(
                    prato: prato,
                  )),
        );
        if (resultado == null) {
          print('Usuário apenas visualizou');
        } else {
          print('Usuário selecionou: $resultado');
        }
      },
      child: Column(
        children: [
          icone,
          Text(
            prato.nome,
          ),
        ],
      ),
    );
  }
}
