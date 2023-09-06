import 'package:flutter/material.dart';

class finalizarCadastro extends StatelessWidget {
  const finalizarCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(35),
      ),
      child: const Center(
        child: Text(
          'Finalizar cadastro',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
