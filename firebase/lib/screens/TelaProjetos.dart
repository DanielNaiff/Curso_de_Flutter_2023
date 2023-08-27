import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login/screens/TelaFormularioUsuario.dart';
import 'package:login/screens/TelaFormularioProjeto.dart';
import 'package:login/widgets/CustomWidgets.dart';
import 'package:login/models/usuario.dart';
import 'package:login/models/projeto.dart';

class TelaProjetos extends StatefulWidget {
  final String uid;
  const TelaProjetos({super.key, required this.uid});

  @override
  State<TelaProjetos> createState() => _TelaProjetosState();
}

class _TelaProjetosState extends State<TelaProjetos> {
  late Stream<Usuario?> _streamUsuario;

  @override
  void initState() {
    super.initState();
    _streamUsuario = FirebaseDatabase.instance
        .ref()
        .child('usuario')
        .child(widget.uid)
        .onValue
        .map((event) {
      DataSnapshot snapshot = event.snapshot;

      String id = snapshot.key!;
      Map? dados = snapshot.value as Map?;

      if (dados == null) {
        return null;
      } else {
        return Usuario.fromJson(id, dados);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Apenas usuários autenticados podem ver esta tela.'),
          Text(widget.uid),
          Expanded(
            child: StreamBuilder<Usuario?>(
              stream: _streamUsuario,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                var dados = snapshot.data;
                final Usuario? usuario = snapshot.data;
                if (dados == null) {
                  return _CorpoSemCadastro(uid: widget.uid);
                } else {
                  return _CorpoComCadastro(usuario: usuario!, uid: widget.uid);
                }
              },
            ),
          ),
          CustomButtom(
            text: 'sair',
            color: Colors.red,
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}

class _CorpoSemCadastro extends StatelessWidget {
  final String uid;

  const _CorpoSemCadastro({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButtom(
        text: 'Finalizar cadastro',
        color: Colors.blue,
        onPressed: FuncaoEditarCadastro(context, uid),
      ),
    );
  }
}

class _CorpoComCadastro extends StatefulWidget {
  final String uid; //atencao
  final Usuario usuario;

  const _CorpoComCadastro({required this.usuario, required this.uid});

  @override
  State<_CorpoComCadastro> createState() => _EstadoCorpoComCadastro();
}

class _EstadoCorpoComCadastro extends State<_CorpoComCadastro> {
  // Funções
  FuncaoCriarNovoProjeto(context, uid, usuario) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaFormularioProjeto(
            uid: widget.uid,
            usuario: widget.usuario,
            idAtual: '',
            novoProjeto: true,
            novoGerente: false,
            idNovoGerente: '',
          ),
        ),
      );
    };
  }

  // Funções
  late Stream<List<Projeto>> _streamProjetos;

  @override
  void initState() {
    super.initState();
    _streamProjetos = FirebaseDatabase.instance
        .ref()
        .child('projetos')
        .orderByChild('id-gerente')
        .equalTo(widget.usuario.id)
        .onValue
        .map((event) {
      DataSnapshot snapshot = event.snapshot;
      Map? dados = snapshot.value as Map?;

      if (dados == null) {
        return [];
      } else {
        return dados.entries.map((entry) {
          String idProjeto = entry.key;
          Map dadosProjeto = entry.value;
          return Projeto.fromJson(idProjeto, dadosProjeto);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // bool _concluido = false;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text('Nome do usuário: ${widget.usuario.nome}'),
          Text('Função: ${widget.usuario.cargo}'),
          Text('Data de entrada: ${widget.usuario.dataEntrada.toString()}'),
          Text('Estado: ${widget.usuario.ativo ? 'Ativo' : 'Inativo'}'),
          const SizedBox(height: 10),
          CustomButtom(
            text: 'Editar cadastro',
            color: Colors.blue,
            onPressed: FuncaoEditarCadastro(context, widget.uid),
          ),
          CustomButtom(
            text: 'Remover dados',
            color: Colors.blue,
            onPressed: () async {
              await FirebaseDatabase.instance
                  .ref()
                  .child('usuarios')
                  .child(widget.uid)
                  .remove();
            },
          ),
          if (widget.usuario.cargo == 'Gerente')
            CustomButtom(
              text: 'Criar novo projeto',
              color: Colors.blue,
              onPressed:
                  FuncaoCriarNovoProjeto(context, widget.uid, widget.usuario),
            ),
          const SizedBox(height: 10),
          Expanded(
            child: StreamBuilder<List<Projeto>>(
              stream: _streamProjetos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LinearProgressIndicator();
                }
                List<Projeto> projetos = snapshot.data!;
                double contador = 0;
                if (projetos.isNotEmpty) {
                  for (int i = 0; i < projetos.length; i++) {
                    if (projetos[i].concluido == true) {
                      contador += 1;
                    }
                  }
                }
                if (projetos.isNotEmpty) {
                  return Column(
                    children: [
                      const Text('Porcentagem de conclusão dos projetos:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      PercenteIndicator(
                          contador: contador, length: projetos.length),
                      Expanded(
                        child: ListView.builder(
                          itemCount: projetos.length,
                          itemBuilder: (context, index) {
                            int compare = (projetos[index]
                                .dataEntrega
                                .compareTo(DateTime.now()));
                            Color vermelho = Colors.red;
                            Color cor = Colors.blue;
                            if (compare == -1 &&
                                projetos[index].concluido == false) {
                              cor = vermelho;
                            }
                            return ListTile(
                              title: Text(
                                projetos[index].nome,
                                style: TextStyle(color: cor),
                              ),
                              subtitle: Text(
                                  projetos[index].numeroMembros.toString()),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TelaFormularioProjeto(
                                            uid: widget.uid,
                                            usuario: widget.usuario,
                                            idAtual: projetos[index].id,
                                            novoProjeto: false,
                                            novoGerente: false,
                                            idNovoGerente: '',
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blueAccent),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

FuncaoEditarCadastro(context, uid) {
  return () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaFormularioUsuario(uid: uid),
      ),
    );
  };
}
