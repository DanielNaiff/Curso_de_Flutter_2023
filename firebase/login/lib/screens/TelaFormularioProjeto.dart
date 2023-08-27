import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login/screens/TelaProjetos.dart';
import 'package:login/screens/TelaUsuarios.dart';
import 'package:login/widgets/CustomWidgets.dart';
import 'package:login/models/usuario.dart';
import 'package:login/models/Projeto.dart';
import 'package:flutter/cupertino.dart';

class TelaFormularioProjeto extends StatefulWidget {
  final Usuario usuario;
  final String uid;
  final String idAtual;
  final bool novoProjeto;
  bool novoGerente = false;
  String idNovoGerente;
  TelaFormularioProjeto(
      {super.key,
      required this.uid,
      required this.usuario,
      required this.idAtual,
      required this.novoProjeto,
      required this.novoGerente,
      required this.idNovoGerente});

  @override
  State<TelaFormularioProjeto> createState() => _TelaFormularioProjetoState();
}

class _TelaFormularioProjetoState extends State<TelaFormularioProjeto> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _numeroMenbros = TextEditingController();
  DateTime _dataEntrega = DateTime.now();
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
          const Text('Selecione o prazo de entrega:'),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() => _dataEntrega = newDateTime);
              },
            ),
          ),
          if (widget.novoProjeto == false)
            CustomButtom(
              text: 'Trocar Gerente',
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaUsuario(
                      uid: widget.uid,
                      usuario: widget.usuario,
                      idAtual: widget.idAtual,
                      novoProjeto: widget.novoProjeto,
                      novoGerente: widget.novoGerente,
                    ),
                  ),
                );
              },
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
              if (widget.novoProjeto == true) {
                DatabaseReference referencia =
                    FirebaseDatabase.instance.ref().child('projetos').push();

                String idUnico = referencia.key!;
                Projeto projeto = Projeto(
                  id: idUnico,
                  idGerente: widget.usuario.id,
                  nome: _nome.text,
                  numeroMembros: int.parse(_numeroMenbros.text),
                  dataEntrega: _dataEntrega,
                  concluido: _concluido,
                );
                await referencia.set(projeto.toJson());
              } else {
                // String idUnico = referencia.key!;
                Projeto projeto = Projeto(
                  id: widget.idAtual,
                  idGerente: widget.novoGerente
                      ? widget.idNovoGerente
                      : widget.usuario.id,
                  nome: _nome.text,
                  numeroMembros: int.parse(_numeroMenbros.text),
                  dataEntrega: _dataEntrega,
                  concluido: _concluido,
                );

                DatabaseReference referencia = FirebaseDatabase.instance
                    .ref()
                    .child('projetos')
                    .child(widget.idAtual)
                    .set(projeto.toJson()) as DatabaseReference;
                await referencia.set(projeto.toJson());
              }
            },
          ),
        ],
      ),
    );
  }
}
