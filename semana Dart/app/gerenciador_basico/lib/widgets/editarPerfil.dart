import 'package:flutter/material.dart';

class editarPerfil extends StatelessWidget {
  const editarPerfil({super.key});

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
          'Editar Perfil',
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
