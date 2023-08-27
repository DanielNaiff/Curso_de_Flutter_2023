import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login/screens/TelaFormularioProjeto.dart';
import 'package:login/models/usuario.dart';

// ignore: must_be_immutable
class TelaUsuario extends StatefulWidget {
  final Usuario usuario;
  final String uid;
  final String idAtual;
  final bool novoProjeto;
  bool novoGerente;
  TelaUsuario({
    super.key,
    required this.uid,
    required this.usuario,
    required this.idAtual,
    required this.novoProjeto,
    required this.novoGerente,
  });

  @override
  State<TelaUsuario> createState() => _TelaUsuarioState();
}

class _TelaUsuarioState extends State<TelaUsuario> {
  late Stream<List<Usuario>> _streamUsuario;

  @override
  void initState() {
    super.initState();
    _streamUsuario =
        FirebaseDatabase.instance.ref().child('usuario').onValue.map((event) {
      DataSnapshot snapshot = event.snapshot;
      Map? dados = snapshot.value as Map?;

      if (dados == null) {
        return [];
      } else {
        return dados.entries.map((entry) {
          String idUsuario = entry.key;
          Map dadosUsuario = entry.value;
          return Usuario.fromJson(idUsuario, dadosUsuario);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
      ),
      body: Container(
        height: double.infinity,
        child: StreamBuilder<List<Usuario>>(
          stream: _streamUsuario,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            List<Usuario> usuario = snapshot.data!;
            return ListView.builder(
              itemCount: usuario.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(usuario[index].nome),
                        subtitle: Column(
                          children: [
                            Text(usuario[index].id),
                            Text('Cargo: ${usuario[index].cargo}'),
                            Text(
                                'Data de entrada: ${usuario[index].dataEntrada}'),
                            Text(
                                'Estado: ${usuario[index].ativo ? 'ativo' : 'inativo'}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                widget.novoGerente = true;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TelaFormularioProjeto(
                                      // novoGerente: widget.novoGerente,
                                      uid: widget.uid,
                                      usuario: widget.usuario,
                                      idAtual: widget.idAtual,
                                      novoProjeto: widget.novoProjeto,
                                      novoGerente: widget.novoGerente,
                                      idNovoGerente: usuario[index].id,
                                      // idNovoGerente: usuario[index].id),
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.add_box,
                                  color: Colors.blueAccent),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
