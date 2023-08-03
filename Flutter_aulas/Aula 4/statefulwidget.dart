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
      Corpo(valor: 42),
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
const Corpo({super.key, required this.valor});
  
   @override
  State<Corpo> createState()=> _EstadoCorpo();
  
}


class _EstadoCorpo extends State <Corpo> {
  int count = 0;
    @override
  Widget build(BuildContext context){
    return Column(
    children: [
      Text('$count'),
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
