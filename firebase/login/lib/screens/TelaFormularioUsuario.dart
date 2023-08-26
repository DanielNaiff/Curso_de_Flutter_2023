import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login/screens/TelaProjetos.dart';
import 'package:login/widgets/CustomWidgets.dart';
import 'package:login/models/usuario.dart';

class TelaFormularioUsuario extends StatefulWidget {
  final String uid;

  const TelaFormularioUsuario({super.key, required this.uid});

  @override
  State<TelaFormularioUsuario> createState() => _TelaFormularioUsuarioState();
}

class _TelaFormularioUsuarioState extends State<TelaFormularioUsuario> {
  final TextEditingController _nome = TextEditingController();
  String _cargo = '';
  bool _estado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Formulario(labelText: 'Nome', controller: _nome),
          DropdownButtonFormField(
            value: _cargo,
            items: const [
              DropdownMenuItem(value: '', child: Text('Selecione o cargo')),
              DropdownMenuItem(
                  value: 'Desenvolvedor', child: Text('Desenvolvedor')),
              DropdownMenuItem(value: 'Gerente', child: Text('Gerente')),
              DropdownMenuItem(value: 'Testador', child: Text('Testador')),
            ],
            onChanged: (value) => setState(() => _cargo = value!),
          ),
          CheckboxListTile(
            title: const Text('Ativo'),
            value: _estado,
            onChanged: (textoAtivo) =>
                setState(() => _estado = textoAtivo as bool),
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
              Usuario usuario = Usuario(
                id: widget.uid,
                nome: _nome.text,
                cargo: _cargo,
                dataEntrada: DateTime.now(),
                ativo: _estado,
              );
              await FirebaseDatabase.instance
                  .ref()
                  .child('usuario')
                  .child(widget.uid)
                  .set(usuario.toJson());
            },
          ),
        ],
      ),
    );
  }
}
