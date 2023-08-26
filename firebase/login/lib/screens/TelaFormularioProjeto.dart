import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login/screens/TelaProjetos.dart';
import 'package:login/widgets/CustomWidgets.dart';
import 'package:login/models/usuario.dart';
import 'package:login/models/Projeto.dart';

class TelaFormularioProjeto extends StatefulWidget {
  final Usuario usuario;
  final String uid;
  const TelaFormularioProjeto(
      {super.key, required this.uid, required this.usuario});

  @override
  State<TelaFormularioProjeto> createState() => _TelaFormularioProjetoState();
}

class _TelaFormularioProjetoState extends State<TelaFormularioProjeto> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _numeroMenbros = TextEditingController();
  DateTime? _dataEntrega;
  bool _concluido = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Formulario(labelText: 'Nome', controller: _nome),
          Formulario(
              labelText: 'Número de menbros', controller: _numeroMenbros),
          CheckboxListTile(
            title: const Text('Concluido?'),
            value: _concluido,
            onChanged: (textoAtivo) =>
                setState(() => _concluido = textoAtivo as bool),
          ),
          CustomButtom(
            text: 'inserir dados',
            color: Colors.blue,
            onPressed: () async {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaProjetos(uid: widget.uid),
                ),
              );
              DatabaseReference referencia =
                  FirebaseDatabase.instance.ref().child('projetos').push();

              String idUnico = referencia.key!;
              Projeto projeto = Projeto(
                id: idUnico,
                idGerente: widget.usuario.id,
                nome: _nome.text,
                numeroMembros: int.parse(_numeroMenbros.text),
                dataEntrega: DateTime(2023, 9, 25),
                concluido: false,
              );
              await referencia.set(projeto.toJson());
            },
          ),
        ],
      ),
    );
  }
}
