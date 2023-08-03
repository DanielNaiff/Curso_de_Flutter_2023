import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
  home: Tela(),));
}

class Tela extends StatelessWidget{
 
  @override
  Widget build(BuildContext context){
  return const Scaffold(
    body: Column(
    children:[
      Cabecalho(),
      Corpo(valor: 42, valorInicial : 3),
    ]),
  );
  }
}

class Cabecalho extends StatefulWidget{
  const Cabecalho({super.key});
  
@override
State<Cabecalho> createState()=> _EstadoCabecalho();
  
}

class _EstadoCabecalho extends State<Cabecalho> {
    @override
  Widget build(BuildContext context){
    return const Text('Cabeçalho');
  }
}

 
class Corpo extends StatefulWidget{
final int valor;
final int valorInicial;
const Corpo({super.key, required this.valor,required this.valorInicial});
  
   @override
  State<Corpo> createState()=> _EstadoCorpo();
  
}


class _EstadoCorpo extends State <Corpo> {
  int count = 0;
  late int valor;
  
@override
  void initState(){
    super.initState();
    valor = widget.valorInicial;
  }
    @override
  Widget build(BuildContext context){
    return Column(
    children: [
      Text('$count'),
      Text('$valor'),
      TextButton(
      child: const Text('Adicionar'),
      onPressed:(){
        setState((){
           count += 1;
        });
      })
    ]);
  }
  
}
