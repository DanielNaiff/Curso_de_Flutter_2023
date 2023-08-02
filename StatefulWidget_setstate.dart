import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  runApp(Myapp(nome: 'Pedro'));
}
class Myapp extends StatefulWidget {
  final String nome;
  const Myapp({Key? key, this.nome=''}): super(key:key);

  @override
  State<Myapp> createState() => _MyapState();
}

class _MyapState extends State<Myapp> {
  int salario = 7000;

  void aumentasalario(int valor){
    setState((){
      this.salario = this.salario + valor;
    });
  }

    void diminuisalario(int valor){
    setState((){
      this.salario = this.salario - valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){print('Clicou');
        // setState((){
        // salario = salario + 100;
        // });
        aumentasalario(200);
        print('Novo salário $salario');
        },
      child: Text('O salário de ${widget.nome} é $salario',textDirection: TextDirection.ltr,
      ),
      ),
    );
  }
}
