import 'package:flutter/material.dart';
import 'package:grenciador_basico/screens/formProject.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:grenciador_basico/models/usuario.dart';
import 'package:grenciador_basico/models/projeto.dart';
import 'package:grenciador_basico/widgets/percent.dart';
import 'package:provider/provider.dart';

class ProjectProvider extends ChangeNotifier {
  late Stream<List<Projeto>> _streamProjetos;

  ProjectProvider(String userId) {
    _streamProjetos = FirebaseDatabase.instance
        .ref()
        .child('projetos')
        .orderByChild('id-gerente')
        .equalTo(userId)
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

  Stream<List<Projeto>> get projectsStream => _streamProjetos;
}

class Projects extends StatefulWidget {
  final String uid;
  final Usuario usuario;
  const Projects({super.key, required this.uid, required this.usuario});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProjectProvider(widget.uid),
      builder: (context, child) {
        final projectProvider = Provider.of<ProjectProvider>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Projetos'),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 5),
                const Text('Porcentagem concluida:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Expanded(
                  child: StreamBuilder<List<Projeto>>(
                    stream: projectProvider.projectsStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator.adaptive();
                      }
                      List<Projeto> projetos = snapshot.data!;
                      double contador = 0;
                      for (int i = 0; i < projetos.length; i++) {
                        if (projetos[i].concluido == true) {
                          contador += 1;
                        }
                      }
                      PercenteIndicator(
                          contador: contador, length: projetos.length);
                      if (projetos.isNotEmpty) {
                        return Column(
                          children: [
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
                                    leading: const SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Icon(Icons.bar_chart)),
                                    title: Text(projetos[index].nome,
                                        style: TextStyle(color: cor)),
                                    subtitle: Text(projetos[index]
                                        .numeroMembros
                                        .toString()),
                                    trailing: SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              await FirebaseDatabase.instance
                                                  .ref()
                                                  .child('projetos')
                                                  .child(projetos[index].id)
                                                  .remove();
                                            },
                                            icon: const Icon(Icons.delete,
                                                color: Colors.red),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      FormularioProjeto(
                                                    uid: widget.uid,
                                                    usuario: widget.usuario,
                                                    idAtual: projetos[index].id,
                                                    novoProjeto: false,
                                                    novoGerente: false,
                                                    idNovoGerente:
                                                        widget.usuario.id,
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: const Icon(Icons.edit,
                                                color: Colors.blueAccent),
                                          ),
                                        ],
                                      ),
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
          ),
        );
      },
    );
  }
}
