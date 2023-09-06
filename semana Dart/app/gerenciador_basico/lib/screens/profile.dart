import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grenciador_basico/screens/formProject.dart';
import 'package:grenciador_basico/screens/formUser.dart';
import 'package:grenciador_basico/screens/projects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:grenciador_basico/models/usuario.dart';
import 'package:grenciador_basico/models/projeto.dart';
import 'package:grenciador_basico/widgets/criarProjeto.dart';
import 'package:grenciador_basico/widgets/editarPerfil.dart';
import 'package:grenciador_basico/widgets/finalizarCadastro.dart';
import 'package:grenciador_basico/widgets/seusProjetos.dart';
import 'package:image_picker/image_picker.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Icon(
              Icons.account_circle,
              size: 120,
            ),
            const SizedBox(height: 17),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormularioUsuario(
                      uid: uid,
                    ),
                  ),
                );
              },
              child: const finalizarCadastro(),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                () async {
                  await FirebaseAuth.instance.signOut();
                };
              },
              child: ListTile(
                leading: Container(
                    height: 40,
                    width: 40,
                    child: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    )),
                title: const Text(
                  'Sair',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CorpoComCadastro extends StatefulWidget {
  final String uid; //atencao
  final Usuario usuario;
  const _CorpoComCadastro(
      {super.key, required this.uid, required this.usuario});

  @override
  State<_CorpoComCadastro> createState() => _CorpoComCadastroState();
}

class _CorpoComCadastroState extends State<_CorpoComCadastro> {
  // ignore: unused_field
  Uint8List? _image;
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      // ignore: no_leading_underscores_for_local_identifiers
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('Nenhuma imagem foi selecionada');
      }
    } else if (kIsWeb) {
      // ignore: no_leading_underscores_for_local_identifiers
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('Nenhuma imagem foi selecionada');
      }
    }
  }

  // ignore: unused_field
  late Stream<List<Projeto>> _streamProjetos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dados'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Stack(
                children: [
                  _pickedImage == null
                      ? const Icon(
                          Icons.account_circle,
                          size: 120,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          //make border radius more than 50% of square height & width
                          child: Image.memory(
                            webImage,
                            height: 100.0,
                            width: 100.0,
                            fit: BoxFit.cover, //change image fill type
                          ),
                        ),
                  Positioned(
                    bottom: -5,
                    left: 75,
                    child: IconButton(
                      onPressed: () {
                        _pickImage();
                      },
                      icon: const Icon(Icons.add_photo_alternate),
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              Text(
                'Olá, ${widget.usuario.nome}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 1),
              Text(
                'Cargo: ${widget.usuario.cargo}',
                style: const TextStyle(fontSize: 17),
              ),
              Text(
                'Data de entrada: ${widget.usuario.dataEntrada.toString()}',
                style: const TextStyle(fontSize: 15),
              ),
              if (widget.usuario.ativo == true)
                const Text(
                  'Ativo',
                  style: TextStyle(color: Colors.green),
                ),
              if (widget.usuario.ativo == false)
                const Text(
                  'Inativo',
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 17),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormularioUsuario(
                        uid: widget.uid,
                      ),
                    ),
                  );
                },
                child: const editarPerfil(),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Projects(uid: widget.uid, usuario: widget.usuario),
                    ),
                  );
                },
                child: const SeusProjetos(),
              ),
              if (widget.usuario.cargo == 'Gerente')
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormularioProjeto(
                          uid: widget.uid,
                          usuario: widget.usuario,
                          idAtual: '',
                          novoProjeto: true,
                          novoGerente: false,
                          idNovoGerente: '',
                        ),
                      ),
                    );
                  },
                  child: const criarProjeto(),
                ),
              MaterialButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: ListTile(
                  leading: Container(
                      height: 40,
                      width: 40,
                      child: const Icon(
                        Icons.logout,
                        color: Colors.red,
                      )),
                  title: const Text(
                    'Sair',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
