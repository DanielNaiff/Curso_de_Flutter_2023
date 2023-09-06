import 'package:flutter/material.dart';

class SeusProjetos extends StatelessWidget {
  const SeusProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          Container(height: 40, width: 40, child: const Icon(Icons.bar_chart)),
      title: const Text('Seus Projetos'),
      trailing: Container(
          height: 30, width: 30, child: const Icon(Icons.arrow_right_alt)),
    );
  }
}
